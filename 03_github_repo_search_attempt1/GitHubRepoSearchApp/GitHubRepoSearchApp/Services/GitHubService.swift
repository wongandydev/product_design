import Foundation

class GitHubService {
    static let shared = GitHubService()

    private let baseURL = "https://api.github.com"

    enum ServiceError: Error {
        case invalidURL
        case invalidResponse
        case networkError(Error)
        case decodingError(Error)
    }

    func searchRepositories(query: String) async throws -> SearchResponse {
        // TODO: Implement this method
        // 1. Construct URL with query parameter
        // 2. Create URLRequest
        // 3. Use URLSession.shared.data(for:) with async/await
        // 4. Validate response status code (200-299)
        // 5. Decode JSON to SearchResponse
        // 6. Return result or throw error

        fatalError("Not implemented")
    }
}
