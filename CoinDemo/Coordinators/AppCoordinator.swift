//
//  AppCoordinator.swift
//  CoinDemo
//
//  Created by Erdi Tunçalp on 3.09.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import XCoordinator

enum AppRoute: Route {
    case coinList
    case coinDetail(cryptocurrency: Cryptocurrency)
}

class AppCoordinator: NavigationCoordinator<AppRoute> {
    
    private var home: Presentable?
    
    init() {
        super.init(initialRoute: .coinList)
    }
    
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch route {
        case .coinList:
            let vc = CoinListViewController()
            vc.bind(to: CoinListViewModelImpl(router: anyRouter))
            return .push(vc)
        case .coinDetail(let cryptocurrency):
            let vc = CoinDetailViewController()
            vc.bind(to: CoinDetailViewModelImpl(cryptocurrency: cryptocurrency))
            return .push(vc)
        }
    }
    
}
