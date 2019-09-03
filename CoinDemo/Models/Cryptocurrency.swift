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
    let dateAdded: Date
    let tags: [String]
    let maxSupply: Double?
    let circulatingSupply: Double?
    let totalSupply: Double?
    let cmcRank: Int?
    let lastUpdated: Date
    let quotes: [String: Quote]
    
    var lastUpdatedFormatted: String {
        return DateFormatter().setDateFormat("MM-dd HH:mm").string(from: self.lastUpdated)
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, symbol, slug
        case numMarketPairs = "num_market_pairs"
        case dateAdded = "date_added"
        case tags
        case maxSupply = "max_supply"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case cmcRank = "cmc_rank"
        case lastUpdated = "last_updated"
        case quotes = "quote"
    }
}
