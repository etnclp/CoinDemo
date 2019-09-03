//
//  Theme.swift
//  CoinDemo
//
//  Created by Erdi Tunçalp on 3.09.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import UIKit

class Theme {
    
    class var colors: ThemeColors {
        struct Singleton {
            static let instance = ThemeColors()
        }
        return Singleton.instance
    }
    
}

open class ThemeColors {
    
    let red = UIColor.hex("#d94040")
    
    let green = UIColor.hex("#009e73")
    
    let blue = UIColor.hex("#1070e0")
    
}
