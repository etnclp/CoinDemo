//
//  CoinDetailViewModelImpl.swift
//  CoinDemo
//
//  Created by Erdi Tunçalp on 2.09.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import RxSwift
import RxCocoa

class CoinDetailViewModelImpl: CoinDetailViewModel {

    // MARK: - Properties
    
    var element: BehaviorRelay<Cryptocurrency>
    
    // MARK: - Initialization
    
    init(cryptocurrency: Cryptocurrency) {
        self.element = .init(value: cryptocurrency)
    }
    
}
