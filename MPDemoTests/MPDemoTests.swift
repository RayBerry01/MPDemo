//
//  MPDemoTests.swift
//  MPDemoTests
//
//  Created by Ray Berry on 23/08/2023.
//

import XCTest
@testable import MPDemo

final class MPDemoTests: XCTestCase {

    class MockCardService: CardServiceProtocol {
        var mockServiceCalled = false
        
        func cards() async -> MPDemo.Card? {
           mockServiceCalled = true 
            return nil
        }
    }
    
    @MainActor func testRandomNumberGenerator() {
        let sut = CardViewModel(cardService: MockCardService())
        let result = sut.generateRandomNumber()
        
        XCTAssertTrue(result >= 100)
        XCTAssertTrue(result <= 300)
    }
    
    func testStripingOfHtmlWithNoHtml() {
        let expected = "dsfjhdshjdfshjdsfhjkdsfhjkfdsjhk"
        let result = expected.stripOutHtml()
        XCTAssertEqual(expected, result)
    }
    
    func testStripingOfHtmlWithHtml() {
        let text = "Friends Good Time Share Personalised Happy Birthday Card <br /><br />Once you've personalised your card or uploaded a photo, and used the handwriting feature on the app, it's time to make their day even brighter by adding flowers and a gift!<br />"
        let expected = "Friends Good Time Share Personalised Happy Birthday Card \n\nOnce you\'ve personalised your card or uploaded a photo, and used the handwriting feature on the app, it\'s time to make their day even brighter by adding flowers and a gift!\n"
        let result = text.stripOutHtml()
        XCTAssertEqual(expected, result)
        
    }
    
    func testCardService() async {
        let sut = MockCardService()
        
        let _ = await sut.cards()
        XCTAssertTrue(sut.mockServiceCalled)
        
    }
}
