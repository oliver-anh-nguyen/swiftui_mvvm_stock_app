//
//  WebService.swift
//  StockApp
//
//  Created by AnhNguyen on 11/08/2022.
//

//https://island-bramble.glitch.me/stocks
//
//https://island-bramble.glitch.me/top-news

import Foundation

class WebService {
    
    func getStocks(completion: @escaping ([Stock]?) -> Void) {
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
            fatalError("URL is not correct")
        }
        URLSession.shared.dataTask(with: url) { data, res, err in
            guard let data = data, err == nil else {
                completion(nil)
                return
            }
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            stocks == nil ? completion(nil) : completion(stocks)
        }.resume()
    }
}
