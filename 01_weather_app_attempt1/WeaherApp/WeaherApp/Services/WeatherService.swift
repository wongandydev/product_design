import Foundation

// MARK: - Weather Service
// TODO: Implement networking layer to fetch weather data

class WeatherService {

    static let shared = WeatherService()

    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    private let apiKey = "demo" // Replace with real API key or use mock data

    private init() {}

    // TODO: Implement method to fetch weather for a city
    // Steps:
    // 1. Construct the URL with query parameters (city name, API key, units)
    // 2. Create URLRequest
    // 3. Use URLSession to make the network call
    // 4. Parse the JSON response into WeatherResponse
    // 5. Handle errors appropriately
    func fetchWeather(for city: String, completion: @escaping (Result<WeatherResponse, NetworkError>) -> Void) {
        // Implement API call here

        // Example URL: https://api.openweathermap.org/data/2.5/weather?q=SanFrancisco&appid=demo&units=metric
    }
}

// MARK: - Network Error
enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case serverError(String)

    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No data received"
        case .decodingError:
            return "Failed to decode response"
        case .serverError(let message):
            return "Server error: \(message)"
        }
    }
}
