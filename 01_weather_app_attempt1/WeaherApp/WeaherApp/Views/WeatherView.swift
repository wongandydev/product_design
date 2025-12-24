import SwiftUI

// MARK: - Weather View
// TODO: Implement the main weather display view

struct WeatherView: View {

    @State private var viewModel: WeatherViewModel
    
    init(viewModel: WeatherViewModel = WeatherViewModel()) {
        self.viewModel = viewModel
    }
//    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                // TODO: Add loading indicator
                // Hint: Use ProgressView when viewModel.isLoading is true
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    contentView
                }

                
            }
            .padding()
            .navigationTitle("Weather")
            .alert(
                // TODO: Add error message
                // Show this when viewModel.errorMessage is not nil
                String(
                    localized: "WeatherView.Alert.Title",
                    defaultValue: "Error"
                ),
                // This is title key i don't think we show this.
                isPresented: $viewModel.showAlert,
                actions: {
                    Button(action: {
                        viewModel.clearAlert()
                    }, label: {
                        Text("OK")
                    })
                },
                message: {
                    Text(viewModel.errorMessage ?? "")
                }
            )
        }
    }
    
    @ViewBuilder
    var contentView: some View {
        if let weatherData = viewModel.weatherData {
            // TODO: Add weather display
            // Show this when viewModel.weatherData is not nil
            // Display: city name, temperature, condition, description
            WeatherCard(weatherData: weatherData)
        } else {
            // TODO: Add search field
            // Hint: Use TextField with a search button
            
            TextField(
                String(
                    localized: "WeatherView.TextField.Search",
                    defaultValue: "Search City"
                ),
                text: $viewModel.searchText
            )
            .textFieldStyle(.roundedBorder)
            
            // .searchable(text: $viewModel.searchText) // I am eager to use this but it might not be the time to be using this lol
            
            // is DEmo will still return mock data. We can add logic to have it return mock data based on search term but out of scope
            
            Button(action: { viewModel.fetchWeather(for: viewModel.searchText) }) {
                Text("Submit")
            }
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


// Claude :Show me other ways to create a subview via var, viewBuilder.
// Goal is not to use a struct as that suggests a reuseable view. This
// is meant to separet view of concerns in a larger view.
struct WeatherCard: View {
    var weatherData: WeatherData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 8) {
                Text("City:")
                Spacer()
                Text(weatherData.cityName)
            }
            
            HStack(spacing: 8) {
                Text("Temperature:")
                Spacer()
                Text(String(weatherData.temperature))
            }
            
            HStack(spacing: 8) {
                Text("Condition: ")
                Spacer()
                Text(weatherData.condition)
            }
            
            HStack(spacing: 8) {
                Text("Description:")
                Spacer()
                Text(weatherData.description)
            }
        }
        .padding(16)
        .background(.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
// MARK: - Preview
#Preview {
//    WeatherCard(weatherData: WeatherData(cityName: "New York City", temperature: 24, condition: "Sunny", description: "It's cold as fuck"))
    
    let weatherData: WeatherData? = nil// WeatherData(cityName: "New York City", temperature: 24, condition: "Sunny", description: "It's cold as fuck")
    return WeatherView(viewModel: WeatherViewModel(weatherData: weatherData))
}
