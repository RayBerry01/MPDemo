//
//  Price.swift
//  MPDemo
//
//  Created by Ray Berry on 26/08/2023.
//

import Foundation

/// Product Price Info
struct Price: Decodable {
    let value: Double
    let currency: String

    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case currency = "Currency"
    }
}
