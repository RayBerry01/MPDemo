//
//  MPDemoTests.swift
//  MPDemoTests
//
//  Created by Ray Berry on 23/08/2023.
//

import XCTest
@testable import MPDemo

final class MPDemoTests: XCTestCase {
    
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
    
    func testCardServiceIsCalled() async {
        let sut = MockCardService()
        
        let _ = await sut.cards()
        XCTAssertTrue(sut.mockServiceCalled)
    }
    
    func testSampleCard() {
        let sut = MockCardService()
        let result = sut.fetchSampleCard()
        XCTAssertEqual(result?.price.value, 4.50)
    }
}
