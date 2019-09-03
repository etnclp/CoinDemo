//
//  Quote.swift
//  CoinDemo
//
//  Created by Erdi Tunçalp on 3.09.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import Foundation

struct Quote: Codable {
    let price, volume24H, percentChange1H, percentChange24H: Double?
    let percentChange7D, marketCap: Double?
    let lastUpdated: String?
    
    enum CodingKeys: String, CodingKey {
        case price
        case volume24H = "volume_24h"
        case percentChange1H = "percent_change_1h"
        case percentChange24H = "percent_change_24h"
        case percentChange7D = "percent_change_7d"
        case marketCap = "market_cap"
        case lastUpdated = "last_updated"
    }
}
