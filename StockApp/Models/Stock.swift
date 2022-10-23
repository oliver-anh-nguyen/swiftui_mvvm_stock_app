//
//  Stock.swift
//  StockApp
//
//  Created by AnhNguyen on 11/08/2022.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
