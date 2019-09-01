//
//  CoinListViewModel.swift
//  CoinDemo
//
//  Created by Erdi Tunçalp on 1.09.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import Action
import Moya
import RxSwift
import RxCocoa

protocol CoinListViewModel {
    var elements: BehaviorRelay<[Cryptocurrency]> { get }
    
    var nextPageTrigger: PublishSubject<Void> { get }
    
    var error: PublishSubject<CoinListViewModelError> { get }
    var loading: BehaviorRelay<Bool> { get }
}

enum CoinListViewModelError: Error {
    case moyaError(MoyaError)
    case other(Error)
}
