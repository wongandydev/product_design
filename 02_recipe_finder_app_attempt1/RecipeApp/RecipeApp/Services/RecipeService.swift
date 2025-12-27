import Foundation

// MARK: - Recipe Service

/// Service responsible for fetching recipe data from TheMealDB API
class RecipeService {

    // MARK: - Properties

    private let baseURL = "https://www.themealdb.com/api/json/v1/1"

    // MARK: - API Methods

    /// Search for recipes by name
    /// - Parameter query: The search term (e.g., "chicken", "pasta")
    /// - Returns: Array of Recipe objects matching the search
    /// - Throws: NetworkError or DecodingError
    func searchRecipes(query: String) async throws -> [Recipe] {
 
        //
        // Steps:
        // 1. Construct URL with query parameter
        //    Example: https://www.themealdb.com/api/json/v1/1/search.php?s=chicken
        // 2. Create URLRequest
        // 3. Use URLSession.shared.data(from:) to fetch data
        // 4. Decode JSON using JSONDecoder
        // 5. Return recipes array (handle nil meals case)
        //
        // Example implementation:
        // guard let url = URL(string: "\(baseURL)/search.php?s=\(query)") else {
        //     throw NetworkError.invalidURL
        // }
        //
        // let (data, _) = try await URLSession.shared.data(from: url)
        // let response = try JSONDecoder().decode(RecipeResponse.self, from: data)
        // return response.meals ?? []
        
        let urlString = baseURL + "search.php?s=" + query
        guard let queryURL = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        let request = URLRequest(url: queryURL)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(RecipeResponse.self, from: data)
                return response.meals ?? []
            } catch {
                throw NetworkError.decodingError
            }
        } catch {
            throw error
        }
    }

    /// Get recipe details by ID
    /// - Parameter id: The recipe ID
    /// - Returns: Recipe object
    /// - Throws: NetworkError or DecodingError
    func getRecipeDetails(id: String) async throws -> Recipe {

        //
        // Endpoint: https://www.themealdb.com/api/json/v1/1/lookup.php?i={id}
        // Similar to searchRecipes but returns single recipe
        let urlString = baseURL + "/lookup.php?i=" + id
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        let request = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            do {
                return try decoder.decode(Recipe.self, from: data)
            } catch {
                throw NetworkError.decodingError
            }
        } catch {
            throw error
        }
    }

    /// Get recipes by category (optional bonus feature)
    /// - Parameter category: Category name (e.g., "Seafood", "Dessert")
    /// - Returns: Array of Recipe objects in that category
    /// - Throws: NetworkError or DecodingError
    func getRecipesByCategory(category: String) async throws -> [Recipe] {

        //
        // Endpoint: https://www.themealdb.com/api/json/v1/1/filter.php?c={category}
        // Note: This endpoint returns simplified recipes (no ingredients/instructions)
        // You may need to call getRecipeDetails for each recipe to get full data

        let urlString = baseURL + "/filter.php?c=" + category
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        let request = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            let recipes = try decoder.decode([Recipe].self, from: data)
            return recipes // TODO: I need to see the contract for this API to know how to approach this .why would the endpoint not give the ful recipe data. We will neeed to make a follow up request when we get the recipes to get the full data before turning. But I am short on time.
        } catch {
            throw error
        }
    }

    /// Get list of all available categories (optional)
    /// - Returns: Array of category names
    /// - Throws: NetworkError or DecodingError
    func getCategories() async throws -> [String] {
        //
        // Endpoint: https://www.themealdb.com/api/json/v1/1/categories.php

        let urlString = baseURL + "/categories.php"
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        let request = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            do {
                return try decoder.decode([String].self, from: data)
            } catch {
                throw NetworkError.decodingError
            }
        } catch {
            throw error
        }
    }
}

// MARK: - Network Error

enum NetworkError: LocalizedError {
    case invalidURL
    case noData
    case decodingError
    case serverError(statusCode: Int)
    case notImplemented

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No data received from server"
        case .decodingError:
            return "Failed to decode response"
        case .serverError(let statusCode):
            return "Server error with status code: \(statusCode)"
        case .notImplemented:
            return "This method has not been implemented yet"
        }
    }
}

// MARK: - Example Usage (for reference)

/*
 // Using the service in a ViewModel or ViewController:

 let service = RecipeService()

 Task {
     do {
         let recipes = try await service.searchRecipes(query: "chicken")
         // Update UI with recipes
     } catch {
         // Handle error
         print("Error: \(error.localizedDescription)")
     }
 }
 */
