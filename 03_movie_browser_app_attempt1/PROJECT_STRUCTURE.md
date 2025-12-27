# Project Structure

```
03_movie_browser_app_attempt1/
├── README.md                          # Main project requirements
├── INTERVIEW_GUIDE.md                 # How to approach the interview
├── SOLUTION_CHECKLIST.md              # What to verify before submitting
├── PROJECT_STRUCTURE.md               # This file
├── SOLUTION.md                        # Complete working implementation reference
│
└── MovieBrowserApp/
    ├── MovieBrowserApp.xcodeproj/     # Xcode project (ready to open!)
    │
    └── MovieBrowserApp/               # Main app target
        ├── MovieBrowserAppApp.swift   # SwiftUI app entry point
        ├── Info.plist                 # App configuration
        ├── Assets.xcassets/           # Images and assets
        │
        ├── Models/
        │   └── Movie.swift            # Data models (TODO: implement Codable)
        │
        ├── Services/
        │   └── MovieService.swift     # Networking layer (TODO: implement API calls)
        │
        ├── ViewModels/
        │   └── MovieListViewModel.swift # State management (TODO: implement logic)
        │
        ├── Views/
        │   ├── MovieListView.swift    # Main list view (functional UI)
        │   ├── MovieDetailView.swift  # Detail view (functional UI)
        │   └── MovieRowView.swift     # List item component (functional UI)
        │
        └── Helpers/
            └── MockData.swift         # Sample JSON data for testing
```

## Getting Started

1. **Open the project**: Double-click `MovieBrowserApp.xcodeproj`
2. **Press ⌘+R**: Build and run - the app will launch with working UI
3. **See the UI**: You'll see a movie list interface (currently using mock data)
4. **Read the TODOs**: Look for TODO comments in the code
5. **Implement features**: Fill in the TODO sections to make it functional
6. **Use SOLUTION_CHECKLIST.md**: Verify you've completed everything

## File Descriptions

### MovieBrowserAppApp.swift
The SwiftUI app entry point. This file is complete and working.
- Defines the main app structure
- Sets `MovieListView` as the root view
- No changes needed here

### Models/Movie.swift
Define your data structures here:
- `Movie` - represents a single movie (id, title, overview, posterPath, etc.)
- `MoviesResponse` - wraps the API response (page, results array, total pages)
- Both should conform to `Codable` for JSON parsing
- Use `CodingKeys` to map snake_case JSON to camelCase Swift properties

**TODO**: Implement the structs to match the TMDB API response structure

### Services/MovieService.swift
Implement networking here:
- `fetchPopularMovies()` - GET request to /movie/popular endpoint
- `searchMovies(query:)` - GET request to /search/movie endpoint
- `imageURL(for posterPath:)` - helper to construct full image URLs
- Error handling with custom `NetworkError` enum
- Use `async/await` for modern Swift concurrency

**TODO**: Implement the service methods with URLSession

### ViewModels/MovieListViewModel.swift
State management and business logic:
- `@Published var movies: [Movie]` - array of movies to display
- `@Published var isLoading: Bool` - loading state
- `@Published var errorMessage: String?` - error message for alerts
- `@Published var searchText: String` - user's search input
- `loadPopularMovies()` - fetches popular movies on app launch
- `searchMovies()` - searches based on user input
- `clearSearch()` - returns to popular movies view

**TODO**: Implement the methods to fetch data from MovieService

### Views/MovieListView.swift
Main list view (already functional!):
- Search bar at the top
- Scrollable list of movies using `List`
- Each row shows poster, title, year, and rating
- Taps navigate to `MovieDetailView`
- Loading indicator when fetching data
- Error alerts when something goes wrong

**Already working** - just needs ViewModel implementation to show real data

### Views/MovieDetailView.swift
Detail view for a single movie (already functional!):
- Larger poster image
- Full title
- Release date
- Rating and vote count
- Full overview/description
- Clean, readable layout

**Already working** - no changes needed

### Views/MovieRowView.swift
Reusable row component for the list:
- Horizontal layout with poster on left
- Title, year, and rating on right
- Uses `AsyncImage` for poster loading
- Handles missing posters gracefully

**Already working** - no changes needed

### Helpers/MockData.swift
Sample data for testing without API calls:
- `sampleMoviesJSON` - JSON string matching TMDB API response format
- `sampleMovie` - single movie for previews
- Use this to test your Codable implementation
- Allows development without API key

**Already working** - use this to test your models!

## Implementation Flow

### Step 1: Models (10 minutes)
Start here because everything else depends on it:
```swift
// In Movie.swift
struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    // ... add more properties
}

struct MoviesResponse: Codable {
    let results: [Movie]
    // ... add pagination properties
}
```

### Step 2: Service (15 minutes)
Implement the networking layer:
```swift
// In MovieService.swift
func fetchPopularMovies() async throws -> MoviesResponse {
    // Construct URL
    // Make request with URLSession
    // Decode response
    // Return result
}
```

### Step 3: ViewModel (10 minutes)
Connect service to views:
```swift
// In MovieListViewModel.swift
func loadPopularMovies() {
    Task {
        isLoading = true
        // Call service
        // Update movies array
        isLoading = false
    }
}
```

### Step 4: Test & Polish (10 minutes)
- Run the app
- Test search
- Test navigation
- Handle errors
- Verify loading states

## Tips

### Working with the TMDB API
- Sign up for free at https://www.themoviedb.org/settings/api
- Or use mock data from `MockData.swift` during development
- Base URL: `https://api.themoviedb.org/3`
- Images: `https://image.tmdb.org/t/p/w500/{posterPath}`

### Testing Strategy
1. Start with mock data to verify models work
2. Switch to real API once models are working
3. Test error cases (bad search, network off)
4. Test navigation flow

### Common Gotchas
- JSON uses `snake_case` (poster_path), Swift uses `camelCase` (posterPath)
- Some fields are optional (backdrop_path can be null)
- Image URLs need base + size + path
- Remember to mark async functions with `await`

### SwiftUI Patterns
- Use `@Published` in ViewModel for reactive updates
- Views automatically re-render when @Published properties change
- `AsyncImage` handles image loading and placeholders
- `NavigationStack` for iOS 16+ navigation

## Quick Start Command

```bash
# From terminal, navigate to project folder
cd 03_movie_browser_app_attempt1/MovieBrowserApp

# Open in Xcode
open MovieBrowserApp.xcodeproj

# Or just double-click the .xcodeproj file in Finder
```

## What You'll See When You Run

1. **First launch**: Empty list with a message (no movies loaded yet)
2. **After implementing**: List of popular movies with posters
3. **After search**: Search results based on your query
4. **After tapping**: Detail view with full movie information

## Need Help?

- Check `README.md` for API documentation and requirements
- Check `INTERVIEW_GUIDE.md` for step-by-step approach
- Check `SOLUTION_CHECKLIST.md` to verify you haven't missed anything
- Check `SOLUTION.md` for complete working code reference
- Look for TODO comments in the code files
- Use `MockData.swift` to test without API calls
