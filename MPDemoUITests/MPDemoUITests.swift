//
//  MPDemoUITests.swift
//  MPDemoUITests
//
//  Created by Ray Berry on 23/08/2023.
//

import XCTest

// TODO - Ran out of time
/// Required tests for UIViews
protocol CardTests {
    func test_cardView_shouldShow_happyPath()
}


// Using BDD/GWT syntax
final class MPDemoUITests: XCTestCase, CardTests {
    
    let app = XCUIApplication()
    
    override func tearDown() {
        app.terminate()
    }
    
    func test_cardView_shouldShow_happyPath() {
        given_thatI_haveLaunched_theApp()
        whenI_see_the_cardView()
        thenI_should_beAble_toScrollup_andDown()
    }

}

extension MPDemoUITests {
    private func given_thatI_haveLaunched_theApp() {
        app.launch()
        continueAfterFailure = false
    }
    
    private func  whenI_see_the_cardView() {
        // wait for card view
        let cardTitle = app.staticTexts["CardViewTitle"]
            XCTAssertTrue(cardTitle.waitForExistence(timeout: 5), "CardViewTitle did not appear")
        
    }
    
    private func thenI_should_beAble_toScrollup_andDown() {
        // Scroll down
        app.swipeUp()
        
        // Scroll up
        app.swipeDown()
    }
    
}
