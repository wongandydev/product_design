//
//  ContentView.swift
//  RecipeApp
//
//  Created by Andy Wong on 12/25/25.
//

import SwiftUI

// MARK: - Placeholder Content View
struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "fork.knife.circle.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.orange)

                Text("Recipe Finder")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("TODO: Implement your app here")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text("Choose your path:")
                    .font(.headline)
                    .padding(.top)

                VStack(alignment: .leading, spacing: 10) {
                    Text("• UIKit: Use RecipeListViewController")
                    Text("• SwiftUI: Use RecipeListView")
                }
                .font(.caption)
                .foregroundColor(.secondary)
            }
            .padding()
            .navigationTitle("Getting Started")
        }
    }
}

#Preview {
    ContentView()
}
