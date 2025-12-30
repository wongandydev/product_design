//
//  TemperatureCardView.swift
//  EightSleepTemperature
//
//  Created by Calvin Chueh on 2/7/25.
//

import Foundation
import SwiftUI

struct TemperatureCardView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Temperature")
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity)
        .frame(minHeight: 400)
        .background(Color.white.opacity(0.1))
        .padding(.horizontal)
    }
}
