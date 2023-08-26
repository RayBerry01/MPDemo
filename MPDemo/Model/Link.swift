//
//  Link.swift
//  MPDemo
//
//  Created by Ray Berry on 26/08/2023.
//

import Foundation

/// Image Link Info
struct Link: Decodable {
    let href: String
    let method: String
    enum CodingKeys: String, CodingKey {
        case href = "Href"
        case method = "Method"
    }
}
