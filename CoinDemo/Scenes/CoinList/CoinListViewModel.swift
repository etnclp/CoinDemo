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
    /**
     Represents a cryptocurrency list.
     */
    var elements: BehaviorRelay<[Cryptocurrency]> { get }
    /**
     This trigger should be called when the next page is triggered.
     */
    var nextPageTrigger: PublishSubject<Void> { get }
    /**
     This trigger should be called when coin is selected.
     */
    var coinSelectionTrigger: InputSubject<Cryptocurrency> { get }
    /**
     Returns an error if has.
     */
    var error: PublishSubject<CoinListViewModelError> { get }
    /**
     This observer is triggered when waiting for the service request.
     */
    var loading: BehaviorRelay<Bool> { get }
}

enum CoinListViewModelError: Error {
    case moyaError(MoyaError)
    case other(Error)
}
