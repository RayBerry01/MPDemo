//
//  MockCardService.swift
//  MPDemo
//
//  Created by Ray Berry on 26/08/2023.
//

import Foundation

/// Concrete implementation of cardServiceProtocol to manage tests and previews
class MockCardService: CardServiceProtocol {
    var mockServiceCalled = false
    
    func cards() async -> MPDemo.Card? {
       mockServiceCalled = true
        return nil
    }
    func fetchSampleCard() -> Product? {
        let sampleLink = Link(href: "https://moonpig.github.io/tech-test-frontend/image/pu041d/0.jpg", method: "Get")
        let sampleProductImage = ProductImage(link: sampleLink)
        let samplePrice = Price(value: 4.51, currency: "£")
        
        let sampleProduct = Product(
            price: samplePrice,
            title: "Sample Card",
            defaultSizeId: 1,
            productId: 123,
            isLandscape: 0,
            description: "This is a sample card details description.",
            productImage: sampleProductImage
        )
        
        return sampleProduct
    }
}
