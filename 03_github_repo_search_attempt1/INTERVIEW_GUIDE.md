# iOS Engineer Interview Challenge

## Overview
Welcome! We'd like you to build a simple GitHub repository search app to demonstrate your iOS development skills.

## Task
Build a SwiftUI app that allows users to search for GitHub repositories and display the results in a scrollable list.

## Requirements
- [ ] Implement a search interface with a text field and search button
- [ ] Fetch repository data from the GitHub API (or use provided mock data)
- [ ] Display results in a scrollable list showing:
  - Repository name
  - Description
  - Star count
  - Programming language
- [ ] Handle loading states (show progress indicator while searching)
- [ ] Handle error states (network errors, no results found)
- [ ] Use MVVM architecture pattern
- [ ] Use modern Swift (async/await, Codable)

## Time Limit
You have **45 minutes** to complete this challenge.

## API Information

**Endpoint:** `https://api.github.com/search/repositories?q={query}`

**Example:** `https://api.github.com/search/repositories?q=swift`

**Sample Response:**
```json
{
  "total_count": 123456,
  "items": [
    {
      "id": 12345,
      "name": "swift",
      "full_name": "apple/swift",
      "description": "The Swift Programming Language",
      "stargazers_count": 65000,
      "language": "C++",
      "html_url": "https://github.com/apple/swift"
    }
  ]
}
```

**Mock Data:** We've included `MockData.swift` in the `Helpers` folder for offline testing. Start with this to build your UI and logic, then integrate the real API if time permits.

**Note:** GitHub's public API doesn't require authentication for search, but has rate limits. Using mock data is recommended during development.

## What We're Looking For
- Clean, readable code with proper naming conventions
- Proper error handling and user feedback
- SwiftUI best practices (proper state management, view composition)
- Appropriate architecture (separation of Model, View, ViewModel, Service)
- Handling of edge cases (empty search, no results, loading states)

## Submission
When finished, compress the entire project folder and submit it for review.

## Getting Started
1. Open `GitHubRepoSearchApp.xcodeproj` in Xcode
2. Run the app (⌘+R) to see the boilerplate UI
3. Review the project structure:
   - `Models/` - Define your data models here
   - `Services/` - Implement API networking here
   - `ViewModels/` - Manage state and business logic here
   - `Views/` - Build your UI here
   - `Helpers/MockData.swift` - Mock JSON data for testing
4. Implement the required functionality
5. Test with mock data first, then try the real API

## Tips
- Focus on core functionality first (search + display results)
- Make sure the app builds and runs without errors
- Handle the happy path, then add error handling
- Keep it simple - a working basic solution is better than an incomplete advanced one

Good luck!
