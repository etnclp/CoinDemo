//
//  CoinDetailViewModel.swift
//  CoinDemo
//
//  Created by Erdi Tunçalp on 2.09.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import RxSwift
import RxCocoa

protocol CoinDetailViewModel {
    /**
     Represents a cryptocurrency model.
     */
    var element: BehaviorRelay<Cryptocurrency> { get }
}
