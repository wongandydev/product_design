import Foundation

@MainActor
class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let movieService = MovieService.shared

    func loadMovies() async {
        // Implement movie loading logic here
    }
}
