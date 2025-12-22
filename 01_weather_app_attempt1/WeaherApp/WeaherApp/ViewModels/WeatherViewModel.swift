import Foundation
import SwiftUI

// MARK: - Weather View Model
// TODO: Implement the view model to manage weather data and state

class WeatherViewModel: ObservableObject {

    // MARK: - Published Properties
    // TODO: Add @Published properties for:
    // - weatherData (optional WeatherData)
    // - isLoading (Bool)
    // - errorMessage (optional String)
    // - searchText (String)

    @Published var weatherData: WeatherData?
    @Published var isLoading = false
    @Published var errorMessage: String?

    // MARK: - Dependencies
    private let weatherService = WeatherService.shared

    // MARK: - Methods

    // TODO: Implement method to fetch weather
    // This should:
    // 1. Set isLoading to true
    // 2. Clear any previous errors
    // 3. Call WeatherService.fetchWeather
    // 4. On success: update weatherData
    // 5. On failure: set errorMessage
    // 6. Set isLoading to false
    func fetchWeather(for city: String) {
        // Implement here
    }

    // TODO: Add any helper methods you need
    // For example:
    // - clearError()
    // - validateCity()
}
