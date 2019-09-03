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
    
    // MARK: - IBOutlets
    
    @IBOutlet weak private var coinImageView: UIImageView!
    @IBOutlet weak private var coinLabel: UILabel!
    @IBOutlet weak private var priceLabel: UILabel!
    @IBOutlet weak private var marketCapLabel: UILabel!
    @IBOutlet weak private var circulatingSupplyLabel: UILabel!
    @IBOutlet weak private var volumeLabel: UILabel!
    @IBOutlet weak private var percentChange1hLabel: UILabel!
    @IBOutlet weak private var percentChange24hLabel: UILabel!
    @IBOutlet weak private var percentChange7dLabel: UILabel!
    @IBOutlet weak private var lastUpdatedLabel: UILabel!
    
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Bindings
    
    func bindViewModel() {
        viewModel.element
            .bind { detail in
                self.title = detail.name
                self.coinImageView.kf.setImage(with: URL(string: "https://s2.coinmarketcap.com/static/img/coins/64x64/\(detail.id).png"))
                self.coinLabel.text = detail.name + " (\(detail.symbol))"
                self.circulatingSupplyLabel.text = (detail.circulatingSupply != nil) ? "\(detail.circulatingSupply!.format)" : "?"
                self.lastUpdatedLabel.text = "Last Updated: " + detail.lastUpdatedFormatted
                
                guard let quote = detail.quotes["USD"] else { return }
                
                self.priceLabel.text = (quote.price != nil) ? "$\(quote.price!.rounded(toPlaces: 2).toString)" : "?"
                self.marketCapLabel.text = (quote.marketCap != nil) ? "$\(quote.marketCap!.format)" : "?"
                self.volumeLabel.text = (quote.volume24H != nil) ? "$\(quote.volume24H!.rounded(toPlaces: 0).format)" : "?"
                self.percentChange1hLabel.text = (quote.percentChange1H != nil) ? "\(quote.percentChange1H!.toString)%": "?"
                self.percentChange24hLabel.text = (quote.percentChange24H != nil) ? "\(quote.percentChange24H!.toString)%": "?"
                self.percentChange7dLabel.text = (quote.percentChange7D != nil) ? "\(quote.percentChange7D!.toString)%": "?"
                
                if let _ = quote.volume24H {
                    self.volumeLabel.textColor = Theme.colors.blue
                }
                if let percent = quote.percentChange1H {
                    self.percentChange1hLabel.textColor = (percent >= 0) ? Theme.colors.green : Theme.colors.red
                }
                if let percent = quote.percentChange24H {
                    self.percentChange24hLabel.textColor = (percent >= 0) ? Theme.colors.green : Theme.colors.red
                }
                if let percent = quote.percentChange7D {
                    self.percentChange7dLabel.textColor = (percent >= 0) ? Theme.colors.green : Theme.colors.red
                }
                
                
            }
            .disposed(by: disposeBag)
    }
    
}
