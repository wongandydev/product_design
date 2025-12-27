import SwiftUI

// MARK: - SwiftUI App Entry Point
// Use this if you prefer SwiftUI over UIKit
// To use: Comment out AppDelegate.swift's @main and uncomment @main below

// @main
struct RecipeAppApp: App {
    var body: some Scene {
        WindowGroup {
             RecipeListView()
        }
    }
}
