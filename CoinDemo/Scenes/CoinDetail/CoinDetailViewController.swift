//
//  CoinDetailViewController.swift
//  CoinDemo
//
//  Created by Erdi Tunçalp on 2.09.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import UIKit
import RxSwift

class CoinDetailViewController: UIViewController, BindableType {
    
    // MARK: - Properties
    
    var viewModel: CoinDetailViewModel!
    
    private(set) var disposeBag = DisposeBag()
    
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Bindings
    
    func bindViewModel() {
        
    }
    
}
