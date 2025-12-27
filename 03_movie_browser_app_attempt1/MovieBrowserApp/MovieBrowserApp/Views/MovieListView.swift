import SwiftUI

// MARK: - Movie List View
// This is the main view that displays a list of movies
// The UI is already functional - you just need to connect it to the ViewModel!

struct MovieListView: View {

    @State private var viewModel = MovieListViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                // Loading state
                if viewModel.isLoading {
                    ProgressView("Loading movies...")
                        .padding()
                }
                // Empty state
                else if viewModel.movies.isEmpty {
                    emptyStateView
                }
                // Movies list
                else {
                    movieListView
                }
            }
            .navigationTitle("Movies")
            .searchable(text: $viewModel.searchText, prompt: "Search movies")
            .onSubmit(of: .search) {
                viewModel.performSearch()
            }
            .onChange(of: viewModel.searchText) { oldValue, newValue in
                // Clear search when user deletes all text
                if newValue.isEmpty {
                    viewModel.loadPopularMovies()
                }
            }
            .onAppear {
                // Load popular movies when view appears (only if not already loaded)
                if viewModel.movies.isEmpty {
                    viewModel.loadPopularMovies()
                }
            }
            .alert("Error", isPresented: $viewModel.showAlert) {
                Button("OK") {
                    viewModel.clearError()
                }
            } message: {
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                }
            }
        }
    }

    // MARK: - Subviews

    private var movieListView: some View {
        List(viewModel.movies) { movie in
            NavigationLink(destination: MovieDetailView(movie: movie)) {
                MovieRowView(movie: movie)
            }
        }
        .listStyle(.plain)
    }

    private var emptyStateView: some View {
        VStack(spacing: 16) {
            Image(systemName: "film")
                .font(.system(size: 60))
                .foregroundColor(.gray)
            Text("No movies to display")
                .font(.headline)
                .foregroundColor(.secondary)
            Text("Search for a movie or check your connection")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

#Preview {
    MovieListView()
}
