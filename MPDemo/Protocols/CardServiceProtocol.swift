//
//  CardServiceProtocol.swift
//  MPDemo
//
//  Created by Ray Berry on 26/08/2023.
//

import Foundation

/// Abstract implementation of card retrieval
protocol CardServiceProtocol {
    func cards() async -> Card?
}
