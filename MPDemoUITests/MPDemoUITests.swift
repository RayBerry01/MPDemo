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
        given_that_I_havelaunched_theApp()
        when_I_See_The_CardView()
        then_I_Should_Beable_ToScrollup_AndDown()
    }

    func test_imageLoad_happyPath() {
        given_that_I_havelaunched_theApp()
        when_I_See_The_CardView()
        then_I_Should_Beable_ToTap_OnAImage()
    }
}

extension MPDemoUITests {
    func given_that_I_havelaunched_theApp() {
        app.launch()
        continueAfterFailure = false
    }
    
    private func  when_I_See_The_CardView() {
        // wait for card view
        XCTAssertTrue(app.otherElements["CardView"].waitForExistence(timeout: 5), "CardView did not appear")
    }
    
    private func then_I_Should_Beable_ToScrollup_AndDown() {
        // Scroll down
        app.swipeUp()
        
        // Scroll up
        app.swipeDown()
    }
    
    private func then_I_Should_Beable_ToTap_OnAImage() {
        let imageView = app.images.firstMatch
            XCTAssertTrue(imageView.waitForExistence(timeout: 5), "Image view did not appear")
            XCTAssertTrue(imageView.isHittable, "Image view is not hittable")
        
    }
    
}
