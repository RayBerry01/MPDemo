//
//  MockCardService.swift
//  MPDemo
//
//  Created by Ray Berry on 26/08/2023.
//

import Foundation

class MockCardService: CardServiceProtocol {
    var mockServiceCalled = false
    
    func cards() async -> MPDemo.Card? {
       mockServiceCalled = true
        return nil
    }
}
