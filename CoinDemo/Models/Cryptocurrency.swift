//
//  Cryptocurrency.swift
//  CoinDemo
//
//  Created by Erdi Tunçalp on 1.09.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import Foundation

struct Cryptocurrency: Codable {
    
    let id: Int
    let name, symbol, slug: String
    let numMarketPairs: Int
    let dateAdded: String
    let tags: [String]
    let maxSupply: Double?
    let circulatingSupply: Double
    let totalSupply: Double
    //let platform: Platform?
    let cmcRank: Int
    let lastUpdated: String
    //let quote: Quote
    
    enum CodingKeys: String, CodingKey {
        case id, name, symbol, slug
        case numMarketPairs = "num_market_pairs"
        case dateAdded = "date_added"
        case tags
        case maxSupply = "max_supply"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        //case platform
        case cmcRank = "cmc_rank"
        case lastUpdated = "last_updated"
        //case quote
    }
}

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
