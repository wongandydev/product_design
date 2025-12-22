import SwiftUI

// MARK: - Weather View
// TODO: Implement the main weather display view

struct WeatherView: View {

    @StateObject private var viewModel = WeatherViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {

                // TODO: Add search field
                // Hint: Use TextField with a search button

                // TODO: Add loading indicator
                // Hint: Use ProgressView when viewModel.isLoading is true

                // TODO: Add weather display
                // Show this when viewModel.weatherData is not nil
                // Display: city name, temperature, condition, description

                // TODO: Add error message
                // Show this when viewModel.errorMessage is not nil

                // Placeholder UI - Replace with your implementation
                Text("Weather App")
                    .font(.largeTitle)

                Spacer()
            }
            .padding()
            .navigationTitle("Weather")
        }
    }

    // MARK: - Subviews
    // TODO: Extract subviews for better organization
    // For example:
    // - SearchBar
    // - WeatherCard
    // - LoadingView
    // - ErrorView
}

// MARK: - Preview
#Preview {
    WeatherView()
}
