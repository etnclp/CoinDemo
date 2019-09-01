//
//  UITableView+ReachedBottom.swift
//  CoinDemo
//
//  Created by Erdi Tunçalp on 2.09.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import RxSwift
import RxCocoa

extension Reactive where Base: UITableView {
    
    var reachedBottom: Observable<Void> {
        return self.willDisplayCell
            .flatMapLatest({ (cell, indexPath) -> Observable<Void> in
                let trigger = (indexPath.section == self.base.numberOfSections - 1) &&
                    (indexPath.item == self.base.numberOfRows(inSection: indexPath.section) - 1)
                return trigger ? .just(()) : .empty()
            })
    }
}
