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
    let name: String
    let main: Main
    let weatherData: [Weather]
    
    
    enum CodingKeys: String, CodingKey {
        case name, main
        case weatherData = "weather"
    }
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let humidity: Int
    let pressure: Int
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}


// MARK: - App Data Model
// This is the cleaned-up model your UI will use
struct WeatherData {
    let cityName: String
    let temperature: Double
    let condition: String
    let description: String

    // TODO: Add an initializer that converts WeatherResponse to WeatherData
    init(response: WeatherResponse) {
        self.cityName = response.name
        self.temperature = response.main.temp
        self.condition = response.weatherData.first?.main ?? "N/A" // Why is weather aan array? How and why..
        self.description = response.weatherData.first?.description ?? "N/A"
    }
    
    init(cityName: String,
         temperature: Double,
         condition: String,
         description: String) {
        self.cityName = cityName
        self.temperature = temperature
        self.condition = condition
        self.description = description
    }
}

