# Project Structure

```
03_github_repo_search_attempt1/
├── README.md                          # Main project requirements and API documentation
├── INTERVIEW_GUIDE.md                 # How to approach the interview
├── SOLUTION_CHECKLIST.md              # What to verify before submitting
├── SETUP.md                           # Setup and running instructions
├── PROJECT_STRUCTURE.md               # This file
│
└── GitHubRepoSearchApp/
    ├── GitHubRepoSearchApp.xcodeproj/ # Xcode project file
    └── GitHubRepoSearchApp/           # Source code
        ├── GitHubRepoSearchApp.swift  # App entry point
        ├── Info.plist                 # App configuration
        ├── Assets.xcassets/           # Images and colors
        │
        ├── Models/
        │   └── Repository.swift       # Data models (TODO: implement)
        │
        ├── Services/
        │   └── GitHubService.swift    # Networking layer (TODO: implement)
        │
        ├── ViewModels/
        │   └── RepositorySearchViewModel.swift  # State management (TODO: implement)
        │
        ├── Views/
        │   ├── SearchView.swift       # Main search interface (TODO: implement)
        │   ├── RepositoryListView.swift   # List of results (TODO: implement)
        │   └── RepositoryRowView.swift    # Single repository row (TODO: implement)
        │
        └── Helpers/
            └── MockData.swift         # Mock JSON data for testing
```

## Getting Started

1. **Read README.md** - Understand the requirements and API structure
2. **Read INTERVIEW_GUIDE.md** - Learn how to approach the problem
3. **Read SETUP.md** - Learn how to run the project
4. **Start implementing** - Follow the recommended order below
5. **Use SOLUTION_CHECKLIST.md** - Verify completeness before finishing

## File Descriptions

### Models/Repository.swift
Define your data structures here:
- `SearchResponse` - Wrapper for API response with total_count and items array
- `Repository` - Main repository model matching API JSON structure
- `Owner` - Repository owner information (login, avatar_url)
- Use `Codable` for automatic JSON parsing
- Handle optional fields properly (description, language can be null)

**Key considerations:**
- Description field can be null - use optional String
- Language field can be null - use optional String
- Star count should be Int
- Proper CodingKeys if property names differ from JSON

**Example structure:**
```swift
struct SearchResponse: Codable {
    let totalCount: Int
    let items: [Repository]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}

struct Repository: Codable, Identifiable {
    let id: Int
    let name: String
    let fullName: String
    let description: String?
    let htmlUrl: String
    let stargazersCount: Int
    let language: String?
    let owner: Owner

    enum CodingKeys: String, CodingKey {
        case id, name, description, language, owner
        case fullName = "full_name"
        case htmlUrl = "html_url"
        case stargazersCount = "stargazers_count"
    }
}

struct Owner: Codable {
    let login: String
    let avatarUrl: String

    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
    }
}
```

### Services/GitHubService.swift
Implement networking here:
- API endpoint construction
- URLSession configuration and requests
- Async/await pattern (required)
- Error handling (network errors, parsing errors)
- Response validation

**Methods to implement:**
```swift
class GitHubService {
    static let shared = GitHubService()

    private let baseURL = "https://api.github.com"

    enum ServiceError: Error {
        case invalidURL
        case invalidResponse
        case networkError(Error)
        case decodingError(Error)
    }

    func searchRepositories(query: String) async throws -> SearchResponse {
        // TODO: Implement
        // 1. Construct URL with query parameter
        // 2. Create URLRequest
        // 3. Use URLSession.shared.data(for:) with async/await
        // 4. Validate response status code
        // 5. Decode JSON to SearchResponse
        // 6. Return result or throw error
        fatalError("Not implemented")
    }
}
```

### ViewModels/RepositorySearchViewModel.swift
State management for SwiftUI:
- Conforms to `ObservableObject`
- `@Published` properties for UI state
- Handles GitHubService calls
- Manages loading, error, and success states
- Input validation (non-empty search query)

**Properties:**
```swift
@MainActor
class RepositorySearchViewModel: ObservableObject {
    @Published var repositories: [Repository] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var searchText: String = ""

    private let service = GitHubService.shared

    func search() async {
        // TODO: Implement
        // 1. Validate searchText is not empty
        // 2. Set isLoading = true
        // 3. Clear previous error
        // 4. Call service.searchRepositories()
        // 5. Handle success (update repositories)
        // 6. Handle error (update errorMessage)
        // 7. Set isLoading = false
    }
}
```

### Views/SearchView.swift
Main search interface:
- NavigationStack wrapper
- TextField for search input
- Search Button to trigger search
- Shows RepositoryListView below
- Displays loading indicator when isLoading = true
- Displays error message when errorMessage is set
- Uses @StateObject for viewModel

**Structure:**
```swift
struct SearchView: View {
    @StateObject private var viewModel = RepositorySearchViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                // Search input section
                HStack {
                    TextField("Enter repository name...", text: $viewModel.searchText)
                    Button("Search") {
                        Task {
                            await viewModel.search()
                        }
                    }
                }

                // Content section
                if viewModel.isLoading {
                    ProgressView("Searching...")
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                } else {
                    RepositoryListView(repositories: viewModel.repositories)
                }
            }
            .navigationTitle("GitHub Search")
        }
    }
}
```

### Views/RepositoryListView.swift
Display search results:
- List or ScrollView with LazyVStack
- Shows RepositoryRowView for each repository
- Handles empty state (no repositories)
- Takes repositories array as parameter

**Structure:**
```swift
struct RepositoryListView: View {
    let repositories: [Repository]

    var body: some View {
        if repositories.isEmpty {
            Text("No results found")
                .foregroundColor(.secondary)
        } else {
            List(repositories) { repo in
                RepositoryRowView(repository: repo)
            }
        }
    }
}
```

### Views/RepositoryRowView.swift
Single repository display:
- VStack layout for organized sections
- Repository name (bold, larger text)
- Full name (owner/repo)
- Description (or "No description available")
- HStack for star count and language
- Proper spacing and padding

**Structure:**
```swift
struct RepositoryRowView: View {
    let repository: Repository

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(repository.name)
                .font(.headline)

            Text(repository.fullName)
                .font(.subheadline)
                .foregroundColor(.secondary)

            if let description = repository.description {
                Text(description)
                    .font(.body)
                    .lineLimit(2)
            } else {
                Text("No description available")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .italic()
            }

            HStack {
                Label("\(formatStarCount(repository.stargazersCount))", systemImage: "star.fill")
                    .foregroundColor(.yellow)

                if let language = repository.language {
                    Text(language)
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(4)
                }
            }
            .font(.caption)
        }
        .padding(.vertical, 4)
    }

    private func formatStarCount(_ count: Int) -> String {
        // TODO: Format large numbers (e.g., 65000 -> "65.0k")
        return "\(count)"
    }
}
```

### Helpers/MockData.swift
Mock JSON data for testing:
- Contains sample GitHub API response
- Use during development to avoid rate limits
- Formatted as Data for easy decoding

```swift
import Foundation

struct MockData {
    static let searchResponseJSON = """
    {
      "total_count": 2,
      "items": [
        {
          "id": 44838949,
          "name": "swift",
          "full_name": "apple/swift",
          "description": "The Swift Programming Language",
          "html_url": "https://github.com/apple/swift",
          "stargazers_count": 65000,
          "language": "C++",
          "owner": {
            "login": "apple",
            "avatar_url": "https://avatars.githubusercontent.com/u/10639145?v=4"
          }
        },
        {
          "id": 12345678,
          "name": "SwiftUI",
          "full_name": "Jinxiansen/SwiftUI",
          "description": "SwiftUI Framework Learning and Usage Guide",
          "html_url": "https://github.com/Jinxiansen/SwiftUI",
          "stargazers_count": 5200,
          "language": "Swift",
          "owner": {
            "login": "Jinxiansen",
            "avatar_url": "https://avatars.githubusercontent.com/u/18518861?v=4"
          }
        }
      ]
    }
    """.data(using: .utf8)!
}
```

## Implementation Order (Recommended)

### 1. Models First (5 min)
Start here because models define your data structure:
```
Repository.swift
├── Create SearchResponse struct with Codable
├── Create Repository struct with Codable
├── Create Owner struct with Codable
├── Add proper CodingKeys for snake_case mapping
└── Test decoding with MockData
```

### 2. Service Layer (10 min)
Build networking foundation:
```
GitHubService.swift
├── Create searchRepositories method
├── Build URL with query parameter
├── Fetch data with URLSession (async/await)
├── Decode JSON with JSONDecoder
└── Handle errors with custom ServiceError
```

### 3. ViewModel (10 min)
State management layer:
```
RepositorySearchViewModel.swift
├── Add @Published properties (repositories, isLoading, errorMessage, searchText)
├── Create search() method with async
├── Call GitHubService
├── Update state based on result (success or error)
└── Use @MainActor for UI updates
```

### 4. Views (15 min)
Build the user interface:
```
Views
├── RepositoryRowView - Single item display (5 min)
├── RepositoryListView - List container (3 min)
└── SearchView - Main search interface (7 min)
    ├── TextField for input
    ├── Search button
    ├── Loading indicator
    ├── Error display
    └── Results list
```

### 5. Testing & Polish (5 min)
- Test with mock data
- Test with real API
- Verify error handling
- Test edge cases (empty search, no results)
- Code cleanup

## Data Flow

```
User Input (Search Text)
    ↓
SearchView TextField ($viewModel.searchText)
    ↓
User taps Search Button
    ↓
SearchView calls viewModel.search()
    ↓
ViewModel.search() validates input
    ↓
ViewModel sets isLoading = true
    ↓
ViewModel calls GitHubService.searchRepositories(query)
    ↓
GitHubService constructs URL
    ↓
GitHubService makes API request (async/await)
    ↓
GitHubService decodes JSON to SearchResponse
    ↓
ViewModel receives SearchResponse
    ↓
ViewModel updates repositories (triggers UI update)
    ↓
ViewModel sets isLoading = false
    ↓
SearchView observes changes and re-renders
    ↓
RepositoryListView displays results
    ↓
RepositoryRowView renders each repository
```

## Error Handling Strategy

Handle these error cases:

1. **Empty Search Query**
   - Check in ViewModel before calling service
   - Show error message: "Please enter a search term"

2. **Network Error**
   - No internet connection
   - Timeout
   - Show error message: "Network error. Please check your connection."

3. **API Error**
   - Server returned error (4xx, 5xx)
   - Show error message: "Server error. Please try again later."

4. **Decoding Error**
   - JSON doesn't match model
   - Show error message: "Failed to parse response."

5. **Empty Results**
   - API returned empty items array
   - Show: "No results found" in RepositoryListView

## State Management

The app has several states to handle:

1. **Initial State**
   - repositories = []
   - isLoading = false
   - errorMessage = nil
   - searchText = ""
   - UI: Shows search field and empty state

2. **Loading State**
   - isLoading = true
   - errorMessage = nil
   - UI: Shows ProgressView

3. **Success State**
   - repositories = [results from API]
   - isLoading = false
   - errorMessage = nil
   - UI: Shows RepositoryListView with results

4. **Error State**
   - repositories = [] (or previous results)
   - isLoading = false
   - errorMessage = "Error description"
   - UI: Shows error message in red

5. **Empty Results State**
   - repositories = []
   - isLoading = false
   - errorMessage = nil
   - UI: Shows "No results found"

## Tips

### URL Construction
```swift
var components = URLComponents(string: baseURL + "/search/repositories")
components?.queryItems = [
    URLQueryItem(name: "q", value: query)
]
guard let url = components?.url else {
    throw ServiceError.invalidURL
}
```

### Async/Await Network Call
```swift
let (data, response) = try await URLSession.shared.data(from: url)

guard let httpResponse = response as? HTTPURLResponse,
      (200...299).contains(httpResponse.statusCode) else {
    throw ServiceError.invalidResponse
}

let searchResponse = try JSONDecoder().decode(SearchResponse.self, from: data)
return searchResponse
```

### @MainActor for UI Updates
```swift
@MainActor
class RepositorySearchViewModel: ObservableObject {
    // All property updates automatically happen on main thread
    @Published var repositories: [Repository] = []

    func search() async {
        // This whole function runs on main thread
        isLoading = true
        do {
            let response = try await service.searchRepositories(query: searchText)
            repositories = response.items  // Safe to update UI
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
```

## Common Pitfalls

- **Not using @MainActor** - UI updates must be on main thread
- **Force unwrapping optionals** - Description and language can be nil
- **Not handling empty search** - Validate input before calling API
- **Blocking main thread** - Use async/await properly
- **No loading state** - User sees blank screen while fetching
- **No error feedback** - App fails silently
- **Mixing concerns** - Keep networking in Service, not in ViewModel or View
- **Improper CodingKeys** - API uses snake_case, Swift uses camelCase

## Success Criteria

By the end, you should have:
- ✅ Working search functionality
- ✅ List of repositories with name, description, stars, language
- ✅ Proper error handling with user-facing messages
- ✅ Loading state indicator
- ✅ Clean MVVM architecture (Model, View, ViewModel, Service)
- ✅ Modern Swift patterns (async/await, Codable, @Published)
- ✅ Can explain your architectural decisions
- ✅ Handles edge cases (empty search, no results, network errors)

## Testing Checklist

Before submitting, test these scenarios:

1. **Happy Path**
   - [ ] Search for "swift" - should return results
   - [ ] Scroll through results - should display properly
   - [ ] Repositories show all required fields

2. **Edge Cases**
   - [ ] Empty search - should show error or prevent search
   - [ ] Search for gibberish "xyzabc123" - should show "No results found"
   - [ ] Repository with null description - should show "No description"
   - [ ] Repository with null language - should handle gracefully

3. **Error Handling**
   - [ ] Turn off WiFi and search - should show network error
   - [ ] Error message is user-friendly and visible

4. **Loading States**
   - [ ] Loading indicator shows during API call
   - [ ] Loading indicator disappears when complete

Good luck!
