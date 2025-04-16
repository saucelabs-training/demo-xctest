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
    
    @Published var secondsElapsed: Int = 0
    private var timerCancellable: AnyCancellable?

    init() {
        timerCancellable = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.secondsElapsed += 1
            }
    }
    
    func increase() {
        counter += 1
    }
    
    func decrease() {
        counter -= 1
    }
}
