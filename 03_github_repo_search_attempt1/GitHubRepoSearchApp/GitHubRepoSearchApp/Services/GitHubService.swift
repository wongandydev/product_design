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

    // Idellly I would pass in the URLSession as as dependency for testability reasons.
    func searchRepositories(query: String) async throws(ServiceError) -> SearchResponse {
        // TODO: Implement this method
        
        let urlString = baseURL + "/" + query
        guard let queryUrl = URL(string: urlString) else {
            throw .invalidURL
        }
        
        // Option we can use URL request if we need network level caching.
        do {
//            let (data, response) = try await URLSession.shared.data(from: queryUrl)
            // when would we throw invalid response?
            
            let data = MockData.searchResponseJSON
            let decoder = JSONDecoder()
            do {
                return try decoder.decode(SearchResponse.self, from: data)
            } catch {
                // CLAUDE: Why does this require me to be explicit with what I am throwing? the compliler was having problems finding this typed error.
                print("ERROR \(error)")
                throw ServiceError.decodingError(error)
            }
        } catch {
            throw .networkError(error)
        }
    }
}
