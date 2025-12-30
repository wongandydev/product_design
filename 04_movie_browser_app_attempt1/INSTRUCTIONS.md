# iOS Engineer Interview Challenge - Movie Browser

## Overview
Welcome! We'd like you to build a simple Movie Browser app to demonstrate your iOS development skills.

## Task
Build a SwiftUI app that fetches and displays a list of popular movies from an API.

## Time Limit
**45 minutes**

## Requirements
- [ ] Fetch popular movies from the provided API endpoint
- [ ] Display movies in a scrollable list showing title, poster, and rating
- [ ] Handle loading state while fetching data
- [ ] Handle error states appropriately
- [ ] Use MVVM architecture pattern

## Technical Constraints
- Use SwiftUI for the UI
- Use MVVM architecture
- Use modern Swift features (async/await, Codable)
- No third-party libraries

## API Information

### Endpoint
```
GET https://api.themoviedb.org/3/movie/popular?api_key=YOUR_API_KEY
```

**Note:** For this exercise, use the mock data provided in `Helpers/MockData.swift` instead of hitting the real API.

### Sample Response
```json
{
  "page": 1,
  "results": [
    {
      "id": 278,
      "title": "The Shawshank Redemption",
      "overview": "Framed in the 1940s for the double murder...",
      "poster_path": "/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg",
      "release_date": "1994-09-23",
      "vote_average": 8.7,
      "vote_count": 26000
    }
  ],
  "total_pages": 500,
  "total_results": 10000
}
```

### Response Fields
- `id`: Unique movie identifier
- `title`: Movie title
- `overview`: Brief description
- `poster_path`: Path to poster image (prefix with `https://image.tmdb.org/t/p/w500`)
- `release_date`: Release date in YYYY-MM-DD format
- `vote_average`: Average rating (0-10)
- `vote_count`: Number of votes

## Project Structure

```
MovieBrowserApp/
├── MovieBrowserApp/
│   ├── MovieBrowserAppApp.swift          # App entry point
│   ├── Models/
│   │   └── Movie.swift                   # ✅ COMPLETE - Data models
│   ├── Services/
│   │   └── MovieService.swift            # ⚠️ IMPLEMENT THIS
│   ├── ViewModels/
│   │   └── MovieListViewModel.swift      # ⚠️ IMPLEMENT THIS
│   ├── Views/
│   │   ├── MovieListView.swift           # ✅ COMPLETE - Main view
│   │   └── MovieRowView.swift            # ✅ COMPLETE - Row view
│   └── Helpers/
│       └── MockData.swift                # ✅ COMPLETE - Test data
```

## What You Need to Implement

### 1. MovieService.swift
Implement the `fetchPopularMovies()` method:
- Create URLRequest for the API endpoint
- Use `async/await` with URLSession
- Decode JSON response to `MoviesResponse`
- Handle errors appropriately

### 2. MovieListViewModel.swift
Implement the `loadMovies()` method:
- Call MovieService to fetch data
- Update `@Published` properties for UI state
- Handle loading and error states
- Use `@MainActor` for UI updates

## Implementation Tips

### Suggested Approach
1. **Start with Models** - Review `Movie.swift` (already complete)
2. **Implement Service** - Add networking logic in `MovieService.swift`
3. **Implement ViewModel** - Add state management in `MovieListViewModel.swift`
4. **Test with Mock Data** - Use provided mock data first
5. **Handle States** - Ensure loading and error states work

### Common Patterns You'll Need
```swift
// Async/await networking
let (data, _) = try await URLSession.shared.data(from: url)
let response = try JSONDecoder().decode(MoviesResponse.self, from: data)

// ViewModel state management
@Published var movies: [Movie] = []
@Published var isLoading = false
@Published var errorMessage: String?

// Error handling
do {
    // network call
} catch {
    errorMessage = error.localizedDescription
}
```

## What We're Looking For
- Clean, readable code following Swift conventions
- Proper separation of concerns (MVVM)
- Appropriate error handling
- Modern Swift patterns (async/await, @Published, @MainActor)
- Loading and error state management
- SwiftUI best practices

## Getting Started
1. Open `MovieBrowserApp.xcodeproj` in Xcode
2. Run the app (⌘+R) to see the boilerplate UI
3. Implement the required functionality in `MovieService.swift` and `MovieListViewModel.swift`
4. Test your implementation

## Submission
When finished, compress the entire project folder.

Good luck!
