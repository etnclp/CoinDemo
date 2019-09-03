//
//  CoinListViewModelImpl.swift
//  CoinDemo
//
//  Created by Erdi Tunçalp on 1.09.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import Action
import Moya
import RxSwift
import RxCocoa
import XCoordinator

class CoinListViewModelImpl: CoinListViewModel {
    
    private let router: AnyRouter<AppRoute>
    
    private let provider = Utils.provider
    
    private var disposeBag = DisposeBag()
    
    private var startItem = 1
    private var isLast = false
    private var limit = 100
    
    //
    
    var elements: BehaviorRelay<[Cryptocurrency]> = .init(value: [])
    
    var nextPageTrigger: PublishSubject<Void> = .init()
    
    lazy var coinSelectionTrigger: InputSubject<Cryptocurrency> = coinSelectionAction.inputs
    
    var error: PublishSubject<CoinListViewModelError> = .init()
    
    var loading: BehaviorRelay<Bool> = .init(value: false)
    
    private lazy var coinSelectionAction = Action<Cryptocurrency,Void> { [unowned self] (currency) in
        return self.router.rx.trigger(AppRoute.coinDetail(cryptocurrency: currency))
    }
    
    // MARK: - Initialization
    
    init(router: AnyRouter<AppRoute>) {
        self.router = router
        
        nextPageTrigger
            .flatMap { _ -> Observable<Welcome<[Cryptocurrency]>> in
                guard self.isLast == false else {
                    self.disposeBag = DisposeBag()
                    return .empty()
                }
                
                return self.getLatestCoinList(start: self.startItem)
                    .catchError { (error) -> Observable<Welcome<[Cryptocurrency]>> in
                        if let error = error as? MoyaError {
                            self.error.onNext(.moyaError(error))
                        } else {
                            self.error.onNext(.other(error))
                        }
                        return .empty()
                }
            }
            .scan([]) { (previous, current) -> [Cryptocurrency] in
                return previous + current.data
            }
            .bind(to: elements)
            .disposed(by: disposeBag)
    }
    
    // MARK: - Actions
    
    private func getLatestCoinList(start: Int = 1) -> Observable<Welcome<[Cryptocurrency]>> {
        return provider.rx.request(.latestListing(start: start, limit: limit))
            .filterSuccessfulStatusAndRedirectCodes()
            .map(Welcome<[Cryptocurrency]>.self, using: Utils.customDecoder)
            .do(onSuccess: { [unowned self] element in
                //log.debug("Fetched started item: \(self.startItem)")
                self.startItem += self.limit
                if element.data.count < self.limit {
                    self.isLast = true
                }
            })
            .asObservable()
    }
    
}
