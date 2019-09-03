//
//  Int+Format.swift
//  CoinDemo
//
//  Created by Erdi Tunçalp on 3.09.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import Foundation

extension Int {
    
    var format: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value: self))
        return formattedNumber ?? ""
    }
    
    var toString: String {
        return "\(self)"
    }
    
}
