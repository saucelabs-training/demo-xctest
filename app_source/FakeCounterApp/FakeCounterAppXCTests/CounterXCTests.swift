//
//  CounterViewModelTests.swift
//  FakeApp3
//
//  Created by Simon Schäfer on 04.02.25.
//

import XCTest
@testable import FakeCounterApp

final class CounterViewModelLongRunningTests: XCTestCase {
    
    override class func setUp() {
        super.setUp()
        NSLog("🧪 Starting long-running test suite (expected ~15 min 30 sec)")
    }

    override class func tearDown() {
        super.tearDown()
    }

    func logStep(_ message: String, vm: CounterViewModel) {
        NSLog("🔹 \(message) | Counter: \(vm.counter), Elapsed: \(vm.secondsElapsed)s")
    }

    func sleepWithVerboseLogs(seconds: Int, label: String, vm: CounterViewModel) {
        let steps = seconds / 10
        logStep("🛌 Entering \(label): will sleep \(steps)x10s", vm: vm)
        for i in 1...steps {
            logStep("🕙 [\(label)] - Sleeping 10s (\(i)/\(steps)", vm: vm)
            sleep(10)
        }
        logStep("😴 Done sleeping for \(label)", vm: vm)
    }

    func testFullJourney_combinedParts() {
        let vm = CounterViewModel() // Create the CounterViewModel instance here
        
        // Part 1: Reset state
        vm.counter = 0
        logStep("Part 1 - Reset counter to 0", vm: vm)
        sleepWithVerboseLogs(seconds: 150, label: "Part 1 (Reset State Wait)", vm: vm)

        // Part 2: Increment
        logStep("Part 2 - Begin increment loop", vm: vm)
        for i in 1...5 {
            vm.increase()
            logStep("⬆️ Incremented \(i)/5", vm: vm)
            sleepWithVerboseLogs(seconds: 30, label: "Increment Wait \(i)", vm: vm)
        }

        // Part 3: Idle
        logStep("Part 3 - Passive wait (no counter changes)", vm: vm)
        sleepWithVerboseLogs(seconds: 150, label: "Part 3 (Idle)", vm: vm)

        // Part 4: Decrement
        logStep("Part 4 - Begin decrement loop", vm: vm)
        for i in 1...5 {
            vm.decrease()
            logStep("⬇️ Decremented \(i)/5", vm: vm)
            sleepWithVerboseLogs(seconds: 30, label: "Decrement Wait \(i)", vm: vm)
        }

        // Part 5: Midway Assertions
        logStep("Part 5 - Midway assertions", vm: vm)
        sleepWithVerboseLogs(seconds: 150, label: "Part 5 (Assertion Delay)", vm: vm)
        XCTAssertEqual(vm.counter, 0, "❗️ Expected counter to be back to 0 after increase/decrease")
        XCTAssertGreaterThan(vm.secondsElapsed, 600, "❗️ Timer should be running > 10 mins")

        // Part 6: Final wait and validation
        logStep("Part 6 - Final wait and validation", vm: vm)
        sleepWithVerboseLogs(seconds: 150, label: "Part 6 (Final Wait)", vm: vm)
        XCTAssertGreaterThanOrEqual(vm.secondsElapsed, 900, "✅ Expected at least 15 minutes of uptime")
        XCTAssertEqual(vm.counter, 0, "✅ Final counter should still be 0")
        
        NSLog("✅ Test suite complete.")
        NSLog("🧾 Final counter: \(vm.counter)")
        NSLog("🕒 Total seconds elapsed: \(vm.secondsElapsed)")
    }
}
