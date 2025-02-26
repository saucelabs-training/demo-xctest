//
//  CounterViewModel.swift
//  FakeCounterApp
//
//  Created by Simon Schäfer on 04.02.25.
//

import OSLog
import Foundation
import Combine

class CounterViewModel: ObservableObject {

    private let logger = Logger(subsystem: "com.yourapp.fakeApp", category: "Counter")

    @Published var counter: Int = 0 {
        didSet {
            logger.log("Counter changed to: \(self.counter)")
        }
    }
    
    func increase() {
        counter += 1
    }
    
    func decrease() {
        counter -= 1
    }
}
