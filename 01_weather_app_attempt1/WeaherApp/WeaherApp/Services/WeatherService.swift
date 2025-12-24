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
    func fetchWeather(isDemo: Bool = true, for city: String, completion: @escaping (Result<WeatherResponse, NetworkError>) -> Void) { // TODO: Remove isBool default in prod. thisis for testing.
        // Implement API call here
        // NOTE: reallst should be async await
        
        if isDemo {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                do {
                    let decoder = JSONDecoder()
                    let weatherResponse = try decoder.decode(WeatherResponse.self, from: MockData.sampleWeatherJSON)
                    completion(.success(weatherResponse))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
            
            return 
        }
        
        
        let requestURLString = baseURL + "?q=" + city.replacingOccurrences(of: " ", with: "").trimmingCharacters(in: .whitespacesAndNewlines) + "&appid=demo&units=metric"// Loook into its would we have new lines?? Good precaution to have either way for now.
        print("[ANDY] Request URL STRING: \(requestURLString)")
        
        guard let requestURL = URL(string: requestURLString) else {
            completion(.failure(.invalidURL))
           return
        }
        
        var request = URLRequest(url: requestURL, cachePolicy: .reloadIgnoringLocalCacheData)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            DispatchQueue.main.async {
                if let error {
                    completion(.failure(.serverError(error.localizedDescription)))
                    return
                }
                
                guard let data else {
                    completion(.failure(.noData))
                    return
                }
                
                let decoder = JSONDecoder()
                do {
                    // TODO: Find out why
                    // Main actor-isolated conformance of 'WeatherResponse' to 'Decodable' cannot be used in nonisolated context; this is an error in the Swift 6 language mode
                    let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
                    completion(.success(weatherResponse))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
        })
        
        task.resume()
        
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
