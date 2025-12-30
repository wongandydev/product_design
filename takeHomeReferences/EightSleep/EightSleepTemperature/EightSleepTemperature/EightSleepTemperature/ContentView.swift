//
//  ContentView.swift
//  EightSleepTemperature
//
//  Created by Calvin Chueh on 2/7/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TemperatureCardView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

#Preview {
    ContentView()
}
