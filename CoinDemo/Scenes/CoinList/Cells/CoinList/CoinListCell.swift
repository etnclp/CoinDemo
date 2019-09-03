//
//  CoinListCell.swift
//  CoinDemo
//
//  Created by Erdi Tunçalp on 2.09.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import UIKit

class CoinListCell: UITableViewCell, SpecialCell {
    
    // MARK: - Properties
    
    static var Height: CGFloat = 77
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var coinImageView: UIImageView!
    
}
