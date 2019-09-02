//
//  CoinListViewController.swift
//  CoinDemo
//
//  Created by Erdi Tunçalp on 1.09.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import UIKit
import Kingfisher
import RxSwift

class CoinListViewController: UIViewController, BindableType {
    
    // MARK: Properties
    
    var viewModel: CoinListViewModel!
    
    private(set) var disposeBag = DisposeBag()
    
    // MARK: IBOutlets
    
    @IBOutlet weak private var tableView: UITableView!
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bind(to: CoinListViewModelImpl())
        
        tableView.rowHeight = CoinListCell.Height
    }
    
    // MARK: - Bindings
    
    func bindViewModel() {
        viewModel.nextPageTrigger.onNext(())
        
        viewModel.elements
            .bind(to: tableView.rx.items(cellType: CoinListCell.self))
            { (row, element, cell) in
                cell.nameLabel.text = element.name
                cell.symbolLabel.text = element.symbol
                cell.coinImageView?.kf.indicatorType = .activity
                cell.coinImageView?.kf.setImage(with: URL(string: "https://s2.coinmarketcap.com/static/img/coins/32x32/\(element.id).png"))
            }
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Cryptocurrency.self)
            .bind { [weak self] element in
                self?.performSegue(withIdentifier: "cryptoDetail", sender: element)
            }
            .disposed(by: disposeBag)
        
        tableView.rx.reachedBottom
            .bind(to: viewModel.nextPageTrigger)
            .disposed(by: disposeBag)
        
        viewModel.error
            .subscribe(onNext: { [weak self] error in
                log.error("Error: \(error)")
                guard let strongSelf = self else { return }
                Utils.showGlobalError(target: strongSelf, message: "Bir sorun oluştu.")
            })
            .disposed(by: disposeBag)
        
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    
}
