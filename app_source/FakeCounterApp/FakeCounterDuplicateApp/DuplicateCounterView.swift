//
//  ContentView.swift
//  FakeCounterDuplicateApp
//
//  Created by Mootaz Bahri on 07.02.25.
//


import SwiftUI

struct DuplicateCounterView: View {
    @StateObject var viewModel = DuplicateCounterViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Duplicate_FakeCounter")
                .font(.system(size: 20, weight: .medium))
            
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

struct DuplicateCounterView_Previews: PreviewProvider {
    static var previews: some View {
        DuplicateCounterView()
    }
}
