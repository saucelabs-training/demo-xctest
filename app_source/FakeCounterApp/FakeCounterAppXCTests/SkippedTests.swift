//
//  SkippedTests.swift
//  FakeApp3Tests
//
//  Created by Simon Schäfer on 05.02.25.
//

import XCTest
@testable import FakeCounterApp


final class SkippedTests: XCTestCase {

    func testThatAlwaysFailsAndShouldBeSkipped() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        XCTAssertTrue(false, "This test always fails and should be skipped!");
    }
}
