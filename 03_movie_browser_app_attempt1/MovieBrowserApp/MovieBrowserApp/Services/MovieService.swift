import Foundation

// MARK: - Movie Service
// TODO: Implement networking layer to fetch movies from TMDB API

class MovieService {

    static let shared = MovieService()

    private let baseURL = "https://api.themoviedb.org/3"
    private let apiKey = "demo" // Replace with real API key or use mock mode
    private let imageBaseURL = "https://image.tmdb.org/t/p"

    private init() {}

    // MARK: - Public Methods

    // TODO: Implement method to fetch popular movies
    // Steps:
    // 1. Construct URL with /movie/popular endpoint
    // 2. Add query parameters: api_key, page
    // 3. Use URLSession with async/await to make the request
    // 4. Parse JSON response into MoviesResponse
    // 5. Handle errors appropriately
    //
    // Example URL: https://api.themoviedb.org/3/movie/popular?api_key=demo&page=1
    func fetchPopularMovies(useMockData: Bool = true) async throws -> MoviesResponse {
        // For development, use mock data to avoid needing an API key
        if useMockData {
            // TODO: Simulate network delay
            // TODO: Decode and return mock data from MockData.sampleMoviesJSON
        }

        // TODO: Implement real API call
        // let endpoint = "/movie/popular"
        // let queryItems = [...]
        // return try await performRequest(...)

        fatalError("fetchPopularMovies not implemented")
    }

    // TODO: Implement method to search for movies
    // Steps:
    // 1. Validate query parameter is not empty
    // 2. Construct URL with /search/movie endpoint
    // 3. Add query parameters: api_key, query, page
    // 4. Use URLSession with async/await to make the request
    // 5. Parse JSON response into MoviesResponse
    // 6. Handle errors appropriately
    //
    // Example URL: https://api.themoviedb.org/3/search/movie?api_key=demo&query=inception&page=1
    func searchMovies(query: String, useMockData: Bool = true) async throws -> MoviesResponse {
        // TODO: Implement search functionality
        // For mock mode, filter MockData by query string

        fatalError("searchMovies not implemented")
    }

    // TODO: Implement helper method to construct image URLs
    // TMDB image URLs are constructed as: {baseURL}/{size}/{posterPath}
    // Example: https://image.tmdb.org/t/p/w500/abc123.jpg
    // Common sizes: w92, w154, w185, w342, w500, w780, original
    func imageURL(for posterPath: String?, size: String = "w500") -> URL? {
        // TODO: Implement image URL construction
        // Handle nil posterPath gracefully

        return nil
    }

    // MARK: - Private Methods

    // TODO: Implement helper method to perform network requests
    // This reduces code duplication between fetchPopularMovies and searchMovies
    // private func performRequest(endpoint: String, queryItems: [URLQueryItem]) async throws -> MoviesResponse {
    //     // Construct URL
    //     // Create URLRequest
    //     // Use URLSession.shared.data(for:)
    //     // Validate HTTP response
    //     // Decode JSON
    //     // Return result
    // }
}

// MARK: - Network Error
// TODO: Define custom error types for better error handling
enum NetworkError: Error, LocalizedError {
    case invalidURL
    case invalidRequest
    case invalidResponse
    case noData
    case decodingError
    case serverError(String)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidRequest:
            return "Invalid request"
        case .invalidResponse:
            return "Invalid response from server"
        case .noData:
            return "No data received"
        case .decodingError:
            return "Failed to decode response"
        case .serverError(let message):
            return "Server error: \(message)"
        }
    }
}
