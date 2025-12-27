import Foundation
import SwiftUI

// MARK: - Movie List View Model
// TODO: Implement the ViewModel to manage movie data and state

@Observable
class MovieListViewModel {

    // MARK: - Published Properties
    // TODO: Add properties that trigger UI updates when changed
    // Required properties:
    // - movies: [Movie] = []
    // - isLoading: Bool = false
    // - errorMessage: String? = nil
    // - searchText: String = ""
    // - showAlert: Bool = false

    var movies: [Movie] = []
    // TODO: Add more @Observable properties here

    // MARK: - Private Properties
    private let movieService = MovieService.shared
    private let useMockData = true // Toggle this to use real API

    // MARK: - Initialization
    init() {
        // Could load popular movies here, but better to do it in onAppear
    }

    // MARK: - Public Methods

    // TODO: Implement method to load popular movies
    // This should:
    // 1. Set isLoading = true
    // 2. Clear any previous errors
    // 3. Call movieService.fetchPopularMovies() using async/await
    // 4. On success: update movies array
    // 5. On failure: set errorMessage and showAlert
    // 6. Set isLoading = false
    //
    // Hint: Use Task { } to call async methods from sync context
    // Hint: Use @MainActor to ensure UI updates happen on main thread
    func loadPopularMovies() {
        // TODO: Implement popular movies loading
    }

    // TODO: Implement method to search for movies
    // This should:
    // 1. Check if searchText is empty (if so, load popular movies instead)
    // 2. Set isLoading = true
    // 3. Clear any previous errors
    // 4. Call movieService.searchMovies() using async/await
    // 5. On success: update movies array (show message if empty results)
    // 6. On failure: set errorMessage and showAlert
    // 7. Set isLoading = false
    func performSearch() {
        // TODO: Implement search functionality
    }

    // TODO: Implement method to clear search
    // This should:
    // 1. Clear searchText
    // 2. Reload popular movies
    func clearSearch() {
        // TODO: Implement clear search
    }

    // TODO: Implement method to dismiss error alert
    func clearError() {
        // TODO: Clear error message and hide alert
    }

    // MARK: - Private Methods

    // TODO: Implement helper to handle errors
    // private func handleError(_ error: Error) {
    //     // Convert Error to user-friendly message
    //     // Set errorMessage and showAlert
    // }
}
