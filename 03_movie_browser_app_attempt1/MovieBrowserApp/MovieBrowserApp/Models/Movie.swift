import Foundation

// MARK: - Movie Model
// TODO: Implement the Movie struct to parse the TMDB API response
// Hint: The API returns JSON with snake_case field names (e.g., "poster_path")
// You'll need to use CodingKeys to map them to camelCase Swift properties

struct Movie: Codable, Identifiable {
    // TODO: Add properties based on TMDB API response
    // Required properties:
    // - id: Int
    // - title: String
    // - overview: String
    // - posterPath: String? (maps to "poster_path" in JSON)
    // - backdropPath: String? (maps to "backdrop_path" in JSON)
    // - releaseDate: String (maps to "release_date" in JSON)
    // - voteAverage: Double (maps to "vote_average" in JSON)
    // - voteCount: Int (maps to "vote_count" in JSON)
    // - genreIds: [Int] (maps to "genre_ids" in JSON)

    // TODO: Add CodingKeys enum to map JSON snake_case to Swift camelCase
    // enum CodingKeys: String, CodingKey {
    //     case id, title, overview
    //     case posterPath = "poster_path"
    //     // Add more mappings...
    // }

    // TODO: Add computed properties for better UX
    // Example:
    // var releaseYear: String {
    //     // Extract year from releaseDate (format: "2024-01-15")
    // }
    //
    // var formattedRating: String {
    //     // Format voteAverage as "8.5"
    // }
}

// MARK: - Movies Response
// TODO: Implement the MoviesResponse struct to parse the API wrapper
// Hint: TMDB API returns movies in a "results" array with pagination info

struct MoviesResponse: Codable {
    // TODO: Add properties based on TMDB API response
    // Required properties:
    // - page: Int
    // - results: [Movie] (this is the array of movies)
    // - totalPages: Int (maps to "total_pages" in JSON)
    // - totalResults: Int (maps to "total_results" in JSON)

    // TODO: Add CodingKeys enum if needed for snake_case mapping
}
