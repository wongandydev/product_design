import Foundation

// MARK: - Weather Response Models
// TODO: Implement the model to parse the OpenWeatherMap API response
// Hint: The API returns JSON with nested objects for "main" and "weather"

struct WeatherResponse: Codable {
    // Add properties here based on API response
    // Example structure from API:
    // {
    //   "name": "San Francisco",
    //   "main": { "temp": 18.5, "humidity": 65 },
    //   "weather": [{ "main": "Clouds", "description": "scattered clouds" }]
    // }
}

// MARK: - App Data Model
// This is the cleaned-up model your UI will use
struct WeatherData {
    let cityName: String
    let temperature: Double
    let condition: String
    let description: String

    // TODO: Add an initializer that converts WeatherResponse to WeatherData
}
