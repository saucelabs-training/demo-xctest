//
//  FakeCounterDuplicateAppTests.swift
//  FakeCounterDuplicateAppTests
//
//  Created by Mootaz Bahri on 07.02.25.
//

import XCTest
@testable import FakeCounterDuplicateApp

class DuplicateCounterViewModelTests: XCTestCase {

    func testCounterIncreaseAndDecreaseDuplicateXCTest() {
        let duplicateViewModel = DuplicateCounterViewModel()

        // Increase 3 times
        duplicateViewModel.increase()
        duplicateViewModel.increase()
        duplicateViewModel.increase()
        sleep(2)
        XCTAssertEqual(duplicateViewModel.counter, 3, "Counter should be 3 after three increases")

        // Decrease 3 times
        duplicateViewModel.decrease()
        duplicateViewModel.decrease()
        duplicateViewModel.decrease()
        sleep(2)
        XCTAssertEqual(duplicateViewModel.counter, 0, "Counter should be 0 after three decreases")
    }
}
