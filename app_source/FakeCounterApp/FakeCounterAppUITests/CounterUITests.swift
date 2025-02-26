//
//  CounterUITests.swift
//  FakeCounterApp
//
//  Created by Simon Schäfer on 04.02.25.
//


import XCTest

class CounterUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testCounterIncreaseAndDecrease() {
        let counterLabel = app.staticTexts["counterLabel"]
        let increaseButton = app.buttons["increaseButton"]
        let decreaseButton = app.buttons["decreaseButton"]

        // Verify initial state.
        XCTAssertEqual(counterLabel.label, "0", "Initial counter should be 0")

        // Tap the increase button 3 times.
        increaseButton.tap()
        increaseButton.tap()
        increaseButton.tap()
        NSLog("DuplicateCounterUITest - Finish Increasing \(counterLabel.label)")
        XCTAssertEqual(counterLabel.label, "3", "Counter should be 3 after three increases")

        // Tap the decrease button 3 times.
        decreaseButton.tap()
        decreaseButton.tap()
        decreaseButton.tap()
        NSLog("DuplicateCounterUITest - Finish Decreasing \(counterLabel.label)")
        XCTAssertEqual(counterLabel.label, "0", "Counter should be 0 after three decreases")
    }
}
