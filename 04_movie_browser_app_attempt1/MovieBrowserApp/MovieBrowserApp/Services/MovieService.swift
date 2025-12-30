import Foundation

enum MovieServiceError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

class MovieService {
    static let shared = MovieService()

    private let baseURL = "https://api.themoviedb.org/3"

    private init() {}

    func fetchPopularMovies() async throws -> MoviesResponse {
        // Implement networking here
        fatalError("Not implemented")
    }
}
