//
//  ProductImage.swift
//  MPDemo
//
//  Created by Ray Berry on 26/08/2023.
//

import Foundation

/// Product Image Info
struct ProductImage: Decodable {
    let link: Link

    enum CodingKeys: String, CodingKey {
        case link = "Link"
    }
}
