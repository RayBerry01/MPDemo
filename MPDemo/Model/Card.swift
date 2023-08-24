//
//  Card.swift
//  MPDemo
//
//  Created by Ray Berry on 23/08/2023.
//

import Foundation

/// Card Info
struct Card: Decodable {
    
    let searchId: String
    let numberOfProducts: Int
    let products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case searchId = "SearchId"
        case numberOfProducts = "NumberOfProducts"
        case products = "Products"
    }
}

/// Product Info
struct Product: Decodable, Identifiable {
    let id = UUID()
    let price: Price
    let title: String
    let productId: Int
    let isLandscape: Int
    let description: String
    let productImage: ProductImage
    
    enum CodingKeys: String, CodingKey {
        case price = "Price"
        case title = "Title"
        case productId = "ProductId"
        case isLandscape = "IsLandscape"
        case description = "Description"
        case productImage = "ProductImage"
    }
}

/// Product Price Info
struct Price: Decodable {
    let value: Double
    let currency: String
    
    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case currency = "Currency"
    }
}

/// Product Image Info
struct ProductImage: Decodable {
    let link: Link
    
    enum CodingKeys: String, CodingKey {
        case link = "Link"
    }
    
}

/// Image Link Info
struct Link: Decodable {
    let href: String
    let method: String
    
    enum CodingKeys: String,CodingKey {
        case href = "Href"
        case method = "Method"
    }
}
