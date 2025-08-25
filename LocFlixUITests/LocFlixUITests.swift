//
//  LocFlixUITests.swift
//  LocFlixUITests
//
//  Created by Puneet Mahajan on 25/08/25.
//

import XCTest

final class MockTestingUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
    }

    func testFetchDataSuccess() throws {
        app.launchArguments = ["UI_TEST_SUCCESS"]
        app.launch()

        // Expect mocked success data to appear on screen
        let successLabel = app.staticTexts["Inception"]
        XCTAssertTrue(successLabel.waitForExistence(timeout: 2))
    }

    func testFetchDataFailure() throws {
        app.launchArguments = ["UI_TEST_FAILURE"]
        app.launch()

        // Expect error label to appear on screen
        let errorLabel = app.staticTexts.containing(NSPredicate(format: "label BEGINSWITH 'Error'")).firstMatch
        XCTAssertTrue(errorLabel.waitForExistence(timeout: 2))
    }
}

