# iOS Interview Challenge: GitHub Repository Search

## Overview
Build a GitHub repository search application that allows users to search for repositories and view basic information about them.

## Time Allocation
**In-person interview**: 45 minutes

## Requirements

### Core Features (Must Have)
1. **Search Functionality**
   - User can search for GitHub repositories by keyword
   - Trigger search with a search button or return key
   - Display search results in a list

2. **Repository List Display**
   - Show multiple repositories in scrollable list
   - Each item should display:
     - Repository name
     - Description (or "No description" if empty)
     - Star count
     - Programming language
     - Owner/organization name

3. **State Management**
   - Show loading indicator while fetching data
   - Display error message when request fails
   - Show empty state when no results found
   - Handle initial state before first search

4. **API Integration**
   - Use GitHub Search API (public, no authentication needed)
   - Handle network requests properly
   - Parse JSON response
   - Handle asynchronous data loading

### Technical Requirements
- Use SwiftUI (required for this challenge)
- Follow MVVM architecture pattern
- Use modern Swift patterns (async/await, Codable)
- Clean, readable code with proper naming conventions
- Handle loading states (show progress indicator while fetching)
- Handle error states (no internet, API failure, no results found)

### Bonus Features (Nice to Have - Only if time permits)
- Open repository URL in Safari when tapped
- Pull to refresh
- Search history
- Debounced search (auto-search as user types)
- Unit tests

## What We're Evaluating
1. **Code Organization** - Proper separation of Model, View, ViewModel, Service
2. **Error Handling** - Edge cases, network failures, user feedback
3. **UI/UX** - Clean interface, loading states, error messages
4. **Swift Best Practices** - Async/await, Codable, proper optionals handling
5. **Architecture** - MVVM pattern implementation
6. **Communication** - Ability to explain your decisions

## API Information

### GitHub Repository Search API (Free - No Authentication Required)

#### Search Repositories
- **Endpoint**: `https://api.github.com/search/repositories?q={query}`
- **Example**: `https://api.github.com/search/repositories?q=swift`
- **Documentation**: https://docs.github.com/en/rest/search

### Sample API Response (Search)
```json
{
  "total_count": 123456,
  "incomplete_results": false,
  "items": [
    {
      "id": 44838949,
      "name": "swift",
      "full_name": "apple/swift",
      "owner": {
        "login": "apple",
        "avatar_url": "https://avatars.githubusercontent.com/u/10639145?v=4"
      },
      "description": "The Swift Programming Language",
      "html_url": "https://github.com/apple/swift",
      "stargazers_count": 65000,
      "language": "C++",
      "forks_count": 10500,
      "open_issues_count": 300,
      "watchers_count": 65000
    },
    {
      "id": 12345678,
      "name": "SwiftUI",
      "full_name": "Jinxiansen/SwiftUI",
      "owner": {
        "login": "Jinxiansen",
        "avatar_url": "https://avatars.githubusercontent.com/u/18518861?v=4"
      },
      "description": "SwiftUI Framework Learning and Usage Guide",
      "html_url": "https://github.com/Jinxiansen/SwiftUI",
      "stargazers_count": 5000,
      "language": "Swift",
      "forks_count": 500,
      "open_issues_count": 10,
      "watchers_count": 5000
    }
  ]
}
```

**Important Fields:**
- `total_count` - Total number of search results
- `items` - Array of repository objects
- `items[].name` - Repository name
- `items[].full_name` - Owner/repo name (e.g., "apple/swift")
- `items[].description` - Repository description (can be null)
- `items[].stargazers_count` - Number of stars
- `items[].language` - Primary programming language (can be null)
- `items[].html_url` - GitHub page URL

**Note**: The API has rate limits (60 requests per hour for unauthenticated requests). For development, use the provided mock data to avoid hitting rate limits.

### Mock Data
Mock JSON data is provided in `Helpers/MockData.swift` for offline testing and development. Use this during initial implementation to avoid API rate limits.

## Getting Started

1. Review the boilerplate code structure in this project
2. Open `GitHubRepoSearchApp.xcodeproj` in Xcode
3. Understand the MVVM architecture setup
4. Start with models and networking layer
5. Build the UI and connect to services
6. Test with mock data first, then integrate real API
7. Handle edge cases and errors

## Interview Tips
- **Ask clarifying questions** - Any specific features you want prioritized?
- **Think out loud** - Explain your architectural decisions before coding
- **Start simple** - Get basic search + display working first, then enhance
- **Show your process** - Comment on trade-offs
- **Handle the full flow** - Loading states, error states, empty states
- **Time management** - 45 minutes goes fast, prioritize core functionality

## Suggested Implementation Order

### 1. Models (5 min)
   - Create `Repository` model matching API response
   - Create `SearchResponse` wrapper model
   - Use Codable for JSON parsing
   - Handle optional fields (description, language)

### 2. Service Layer (10 min)
   - Create `GitHubService` with search method
   - Set up URLSession networking with async/await
   - Build URL with query parameter
   - Decode JSON response
   - Handle errors properly

### 3. ViewModel (10 min)
   - Create `RepositorySearchViewModel`
   - Add @Published properties for state
   - Implement search method
   - Handle loading, success, error states
   - Connect to GitHubService

### 4. Views (15 min)
   - Create `SearchView` with TextField and Button
   - Create `RepositoryListView` to display results
   - Create `RepositoryRowView` for each item
   - Add loading indicator
   - Add error message display
   - Add empty state view

### 5. Polish (5 min)
   - Test with different search queries
   - Verify error handling
   - Code cleanup
   - Final testing

## Common Pitfalls to Avoid
- Force unwrapping optionals (use optional binding or nil coalescing)
- Not handling null descriptions or languages from API
- Blocking main thread with network calls
- Not showing loading states
- Ignoring error cases
- Over-engineering the solution in limited time
- Not testing edge cases (empty search, no results, network error)

## Example UI Flow

```
┌─────────────────────────┐
│   Repository Search     │
│                         │
│  ┌───────────────────┐  │
│  │ Enter search...   │  │
│  └───────────────────┘  │
│  [Search Button]        │
│                         │
│  ┌───────────────────┐  │  ← Loading State
│  │   Loading...      │  │
│  └───────────────────┘  │
│                         │
│  OR                     │
│                         │
│  ┌───────────────────┐  │  ← Results State
│  │ apple/swift       │  │
│  │ The Swift Lang... │  │
│  │ ⭐ 65.0k  C++     │  │
│  ├───────────────────┤  │
│  │ Jinxiansen/...    │  │
│  │ SwiftUI Guide     │  │
│  │ ⭐ 5.0k  Swift    │  │
│  └───────────────────┘  │
│                         │
│  OR                     │
│                         │
│  ┌───────────────────┐  │  ← Error State
│  │ Network Error     │  │
│  │ [Retry]           │  │
│  └───────────────────┘  │
└─────────────────────────┘
```

## Questions to Consider

Before you start coding:
1. Should I implement auto-search as user types or require button click?
2. Do you want repository detail view or just the list?
3. Any preference on how to display star count (raw number vs formatted like "1.2k")?
4. Should empty/null language show as "Unknown" or be hidden?

Good luck!
