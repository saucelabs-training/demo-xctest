//
//  CounterViewModelTests.swift
//  FakeApp3
//
//  Created by Simon Schäfer on 04.02.25.
//


import XCTest
@testable import FakeCounterApp

class CounterViewModelTests: XCTestCase {

    func testCounterIncreaseAndDecrease() {
        let viewModel = CounterViewModel()
        
        // Increase 3 times
        viewModel.increase()
        viewModel.increase()
        viewModel.increase()
        sleep(2)
        XCTAssertEqual(viewModel.counter, 3, "Counter should be 3 after three increases")
        
        // Decrease 3 times
        viewModel.decrease()
        viewModel.decrease()
        viewModel.decrease()
        sleep(2)
        XCTAssertEqual(viewModel.counter, 0, "Counter should be 0 after three decreases")
    }
}
