import Foundation

// MARK: - Mock Data
// Use this for testing without making real API calls

struct MockData {

    // Sample JSON response from OpenWeatherMap API
    static let sampleWeatherJSON = """
    {
        "name": "San Francisco",
        "main": {
            "temp": 18.5,
            "feels_like": 17.2,
            "humidity": 65,
            "pressure": 1013
        },
        "weather": [
            {
                "id": 803,
                "main": "Clouds",
                "description": "broken clouds",
                "icon": "04d"
            }
        ],
        "wind": {
            "speed": 3.5
        }
    }
    """.data(using: .utf8)!

    // Helper to create mock WeatherResponse
    static var sampleWeatherResponse: WeatherResponse? {
        let decoder = JSONDecoder()
        return try? decoder.decode(WeatherResponse.self, from: sampleWeatherJSON)
    }

    // TODO: You can add more mock data here for different scenarios
    // - Different weather conditions
    // - Error responses
    // - Edge cases
}
