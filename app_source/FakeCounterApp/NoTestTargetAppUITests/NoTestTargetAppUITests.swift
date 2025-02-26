//
//  NoTestTargetAppUITests.swift
//  NoTestTargetAppUITests
//
//  Created by Mootaz Bahri on 12.02.25.
//

import XCTest

final class NoTestTargetAppUITests: XCTestCase {
    var app_calculator: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app_calculator = XCUIApplication(bundleIdentifier: "com.apple.calculator")
        app_calculator.launch()
    }

    func testOpeningSystemApps() throws {

        app_calculator.launch()
        app_calculator.buttons["2"].tap()
        sleep(1)
        app_calculator.buttons["3"].tap()
        sleep(2)
    }
}
