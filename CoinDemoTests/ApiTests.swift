//
//  ApiTests.swift
//  CoinDemoTests
//
//  Created by Erdi Tunçalp on 31.08.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import Quick
import Nimble
import Moya
@testable import CoinDemo

class ApiTests: QuickSpec {
    
    override func spec() {
        describe("Provider test json") {
            var provider: MoyaProvider<CoinMarketCapAPI>!
            
            beforeEach {
                provider = .init(endpointClosure: self.customEndpointClosure, stubClosure: MoyaProvider.immediatelyStub)
            }
            
            it("emits a Response object") {
                var called = false
                
                _ = provider.rx.request(.latestListing(start: nil, limit: nil))
                    .subscribe { event in
                        switch event {
                        case .success(let response):
                            log.debug(response)
                            called = true
                        case .error(let error):
                            fail("errored: \(error)")
                        }
                }
                
                expect(called).to(beTrue())
            }
        }
        
        describe("API request test spec") {
            var provider: MoyaProvider<CoinMarketCapAPI>!
            let limit = 50
            
            beforeEach {
                provider = .init(plugins: [NetworkLoggerPlugin(cURL: true)])
            }
            
            it("get cryptocurrency model") {
                waitUntil { done in
                    _ = provider.rx.request(.latestListing(start: nil, limit: limit))
                        .map(Welcome<[Cryptocurrency]>.self)
                        .subscribe { event in
                            switch event {
                            case .success(let element):
                                expect(element.data.count) == limit
                                done()
                            case .error(let error):
                                log.error("errored \(error)")
                                fail("errored: \(error)")
                                done()
                            }
                        }
                }
            }
        }
    }
    
    func customEndpointClosure(_ target: CoinMarketCapAPI) -> Endpoint {
        return Endpoint(url: URL(target: target).absoluteString,
                        sampleResponseClosure: { .networkResponse(200, target.testSampleData) },
                        method: target.method,
                        task: target.task,
                        httpHeaderFields: target.headers)
    }
    
}

extension CoinMarketCapAPI {
    var testSampleData: Data {
        switch self {
        case .latestListing:
            let url = Bundle(for: ApiTests.self).url(forResource: "Listing1", withExtension: "json")!
            return try! Data(contentsOf: url)
        }
    }
}
