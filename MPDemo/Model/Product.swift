//
//  Product.swift
//  MPDemo
//
//  Created by Ray Berry on 26/08/2023.
//

import Foundation

/// Product Info
struct Product: Decodable, Identifiable {
    let id = UUID()
    let price: Price
    let title: String
    let defaultSizeId: Int
    let productId: Int
    let isLandscape: Int
    let description: String
    let productImage: ProductImage

    enum CodingKeys: String, CodingKey {
        case price = "Price"
        case title = "Title"
        case defaultSizeId = "DefaultSizeId"
        case productId = "ProductId"
        case isLandscape = "IsLandscape"
        case description = "Description"
        case productImage = "ProductImage"
    }
}
