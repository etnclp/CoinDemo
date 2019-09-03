//
//  Utils.swift
//  CoinDemo
//
//  Created by Erdi Tunçalp on 2.09.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import UIKit
import Moya

class Utils {
    
    /// Global CoinMarketCapAPI provider.
    static let provider: MoyaProvider<CoinMarketCapAPI> = {
        #if DEBUG
        return .init(plugins: [NetworkLoggerPlugin(cURL: true)])
        #else
        return .init()
        #endif
    }()
    
    /**
     Custom decoder for date formatting.
     */
    class var customDecoder: JSONDecoder {
        let formatter = DateFormatter()
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            if let date = formatter.date(from: dateString) {
                return date
            }
            formatter.dateFormat = "yyyy-MM-dd"
            if let date = formatter.date(from: dateString) {
                return date
            }
            throw DecodingError.dataCorruptedError(in: container,
                                                   debugDescription: "Cannot decode date string \(dateString)")
        }
        return decoder
    }
    
    /**
     Represents an AlertController for easy use.
     
     - Parameters:
        - viewController: Which ViewController should also be presented.
        - message: Message to display.
        - title: Alert's title.
        - handler: Closure to be called before the alert closes.
     */
    class func showGlobalError(target viewController: UIViewController, message: String? = nil, title: String? = nil, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title ?? "Uyarı", message: message ?? "Bir sorun oluştu.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: handler))
        viewController.present(alert, animated: true, completion: nil)
    }
    
}

