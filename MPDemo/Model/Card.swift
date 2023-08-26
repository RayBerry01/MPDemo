//
//  Card.swift
//  MPDemo
//
//  Created by Ray Berry on 23/08/2023.
//

import Foundation

/// Card Info
struct Card: Decodable{
    
    let searchId: String
    let numberOfProducts: Int
    let products: [Product]

    enum CodingKeys: String, CodingKey {
        case searchId = "SearchId"
        case numberOfProducts = "NumberOfProducts"
        case products = "Products"
    }
}
