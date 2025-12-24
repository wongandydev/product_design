import Foundation
import SwiftUI

// MARK: - Weather View Model
// TODO: Implement the view model to manage weather data and state

@Observable
class WeatherViewModel { // NOTE: SHhouldn't use ObservableObject thats the old way of doing things.
    
    // MARK: - Published Properties
    // TODO: Add @Published properties for:
    // - weatherData (optional WeatherData)
    // - isLoading (Bool)
    // - errorMessage (optional String)
    // - searchText (String)
    
    var weatherData: WeatherData?
    var isLoading = false
    var showAlert: Bool = false
    var errorMessage: String? {
        didSet {
            showAlert = errorMessage != nil
        }
    }
    var searchText: String = ""

    init(weatherData: WeatherData? = nil) {
        self.weatherData = weatherData
    }
    
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
        // / Understand why defer here runs even though the closure block hasn;t reutrn
        // Based on my understnad/best guess its ebcause the closure block runs of anotehr threa
        // and this func is considered completed.
        // May need more reading/understand of this.
//        defer { isLoading = false }
        
        isLoading = true
        errorMessage = nil
        
        weatherService.fetchWeather(for: city, completion: { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let response):
                self?.weatherData = WeatherData(response: response)
            case .failure(let error):
                self?.showAlert(errorMessage: error.localizedDescription)
            }
        })
    }
    
    func showAlert(errorMessage: String) {
        self.errorMessage = errorMessage
    }
    
    func clearAlert() {
        self.errorMessage = nil
    }
    
    // TODO
    func validateCity() {
        
    }

    // TODO: Add any helper methods you need
    // For example:
    // - clearError()
    // - validateCity()
}
