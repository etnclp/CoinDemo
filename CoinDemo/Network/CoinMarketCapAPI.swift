//
//  CoinMarketCapAPI.swift
//  CoinDemo
//
//  Created by Erdi Tunçalp on 31.08.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import Moya

enum CoinMarketCapAPI {
    
    case latestListing(start: Int?, limit: Int?)
    
}

extension CoinMarketCapAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://pro-api.coinmarketcap.com/v1/cryptocurrency")!
    }
    
    var path: String {
        switch self {
        case .latestListing: return "/listings/latest"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .latestListing: return .get
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .latestListing(let start, let limit):
            return [
                "start": "\(start ?? 1)",
                "limit": "\(limit ?? 100)",
                //"sort": "rank",
                //"structure": "array",
                "convert": "USD"
            ]
        }
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        default:
            if method == .post {
                return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            } else {
                return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
            }
        }
    }
    
    var headers: [String : String]? {
        return [
            "X-CMC_PRO_API_KEY" : "103725a7-8317-4e13-86eb-7cdc288f51ce",
            "Accept" : "application/json",
        ]
    }
    
}
