//
//  Welcome.swift
//  CoinDemo
//
//  Created by Erdi Tunçalp on 1.09.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import Foundation

struct Welcome<T: Codable>: Codable {
    let status: Status
    let data: T
}

struct Status: Codable {
    let timestamp: String
    let errorCode: Int
    let errorMessage: String?
    let elapsed: Int
    let creditCount: Int
    
    enum CodingKeys: String, CodingKey {
        case timestamp
        case errorCode = "error_code"
        case errorMessage = "error_message"
        case elapsed
        case creditCount = "credit_count"
    }
}
