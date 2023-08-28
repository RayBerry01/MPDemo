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

    private func test_imageLoad_happyPath() {
        given_thatI_haveLaunched_theApp()
        whenI_see_the_cardView()
        then_I_should_beAble_toTap_onAImage()
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
        XCTAssertTrue(cardTitle.exists)
        
        let cardGridView = app.otherElements["CardGridView"]
        XCTAssertTrue(cardGridView.exists)
        
    }
    
    private func thenI_should_beAble_toScrollup_andDown() {
        // Scroll down
        app.swipeUp()
        
        // Scroll up
        app.swipeDown()
    }
    
    private func then_I_should_beAble_toTap_onAImage() {
        let imageView = app.images.firstMatch
        
        let cardImage = app.staticTexts["CardImageView"]
        XCTAssertTrue(cardImage.exists)
        
        XCTAssertTrue(imageView.isHittable, "Image view is not hittable")
    }
}
