//
//  DateFormatter+Addition.swift
//  CoinDemo
//
//  Created by Erdi Tunçalp on 3.09.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import Foundation

extension DateFormatter {
    func setDateFormat(_ format: String) -> Self {
        self.dateFormat = format
        return self
    }
}
