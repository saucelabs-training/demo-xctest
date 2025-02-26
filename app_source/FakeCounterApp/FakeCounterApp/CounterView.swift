//
//  CounterView.swift
//  FakeCounterApp
//
//  Created by Simon Schäfer on 04.02.25.
//


import SwiftUI

struct CounterView: View {
    @StateObject var viewModel = CounterViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Image("CounterIcon")
                          .resizable()
                          .scaledToFit()
                          .frame(width: 100, height: 100) // Adjust size as needed
            
            Text("\(viewModel.counter)")
                .font(.system(size: 80, weight: .bold))
                .accessibilityIdentifier("counterLabel")
            
            Button("Increase") {
                viewModel.increase()
            }
            .accessibilityIdentifier("increaseButton")
            .font(.title2)
            
            Button("Decrease") {
                viewModel.decrease()
            }
            .accessibilityIdentifier("decreaseButton")
            .font(.title2)
        }
        .padding()
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}
