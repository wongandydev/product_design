# Setup Instructions

## Prerequisites
- macOS with Xcode 15.0 or later
- iOS 17.0+ SDK
- No additional dependencies or CocoaPods needed

## Opening the Project

1. Navigate to the project folder:
   ```
   03_github_repo_search_attempt1/GitHubRepoSearchApp/
   ```

2. Double-click `GitHubRepoSearchApp.xcodeproj` to open in Xcode

3. Wait for Xcode to index the project (usually takes a few seconds)

## Running the App

1. Select a simulator from the device menu (recommended: iPhone 15 Pro)
   - Click the device dropdown near the play button
   - Choose any iOS 17.0+ device

2. Press `⌘+R` or click the Play button to build and run

3. The app should launch in the simulator within 10-30 seconds

## Project Configuration

### Build Settings
- **Deployment Target**: iOS 17.0
- **Swift Version**: Swift 5.9+
- **Bundle Identifier**: `com.interview.GitHubRepoSearchApp`

### Info.plist
No special permissions required. The app uses:
- Standard network access (HTTP requests)
- No camera, location, or other sensitive APIs

## Troubleshooting

### Issue: "Failed to build"
**Solution**: Clean build folder
- Press `⌘+Shift+K` (Product → Clean Build Folder)
- Try building again with `⌘+R`

### Issue: "Signing requires a development team"
**Solution**: Select your Apple ID team
1. Select the project in the navigator (blue icon at top)
2. Select the target "GitHubRepoSearchApp"
3. Go to "Signing & Capabilities" tab
4. Under "Team", select your Apple ID or "Add an Account..."
5. If doing this on personal device, you can use a free Apple ID

### Issue: "No such module" errors
**Solution**: The project has no external dependencies
- Ensure all `.swift` files are in the correct folders
- Check that files are added to the target (File Inspector → Target Membership)

### Issue: Simulator not launching
**Solution**: Restart simulator
1. Close the Simulator app completely
2. In Xcode, select a different device, then select your original device again
3. Try running again

### Issue: API rate limit exceeded
**Solution**: Use mock data
- The GitHub API has a limit of 60 requests/hour for unauthenticated requests
- Use the provided `MockData.swift` instead of real API calls during development
- In `GitHubService.swift`, you can temporarily return mock data:
  ```swift
  func searchRepositories(query: String) async throws -> SearchResponse {
      // Use mock data during development
      let decoder = JSONDecoder()
      return try decoder.decode(SearchResponse.self, from: MockData.searchResponseJSON)
  }
  ```

## Development Workflow

### Recommended Order
1. Implement Models (Repository, SearchResponse, Owner)
2. Test model decoding with MockData
3. Implement GitHubService
4. Implement ViewModel
5. Build Views (RepositoryRowView → RepositoryListView → SearchView)
6. Test with mock data first
7. Switch to real API
8. Handle errors and edge cases

### Testing During Development

**Use Mock Data First:**
```swift
// In GitHubService.swift - temporary implementation
func searchRepositories(query: String) async throws -> SearchResponse {
    let decoder = JSONDecoder()
    return try decoder.decode(SearchResponse.self, from: MockData.searchResponseJSON)
}
```

This allows you to:
- Develop UI without network calls
- Avoid API rate limits
- Test faster without internet dependency

**Switch to Real API Later:**
```swift
func searchRepositories(query: String) async throws -> SearchResponse {
    var components = URLComponents(string: baseURL + "/search/repositories")
    components?.queryItems = [URLQueryItem(name: "q", value: query)]

    guard let url = components?.url else {
        throw ServiceError.invalidURL
    }

    let (data, response) = try await URLSession.shared.data(from: url)

    guard let httpResponse = response as? HTTPURLResponse,
          (200...299).contains(httpResponse.statusCode) else {
        throw ServiceError.invalidResponse
    }

    let decoder = JSONDecoder()
    return try decoder.decode(SearchResponse.self, from: data)
}
```

### Live Preview (SwiftUI)

You can use Xcode's live preview feature:
1. Open any SwiftUI View file
2. Press `⌥+⌘+↵` (Option+Command+Return) to show Canvas
3. Click "Resume" if preview is paused
4. See live updates as you edit code

**Example preview code:**
```swift
#Preview {
    SearchView()
}
```

### Debugging

**Print Debugging:**
```swift
print("Search query: \(searchText)")
print("Repositories count: \(repositories.count)")
```

**Breakpoints:**
- Click on line number in Xcode to add breakpoint
- Run app in debug mode (⌘+R)
- Execution will pause at breakpoint
- Inspect variables in debug panel

**View Hierarchy:**
- Run app in simulator
- Click 🔍 icon at bottom of Xcode (Debug View Hierarchy)
- See 3D view of your UI structure

## File Organization

```
GitHubRepoSearchApp/
├── Models/              → Define your data structures
├── Services/            → Implement API calls
├── ViewModels/          → Manage state and logic
├── Views/               → Build SwiftUI interfaces
└── Helpers/             → Utility code and mock data
```

## Quick Reference

### Keyboard Shortcuts
- `⌘+R` - Run app
- `⌘+B` - Build project
- `⌘+Shift+K` - Clean build folder
- `⌘+.` - Stop running app
- `⌥+⌘+↵` - Show Canvas (SwiftUI preview)
- `⌘+Shift+O` - Open quickly (search files)
- `⌘+/` - Toggle comment

### Common Xcode Actions
- **Navigate to file**: `⌘+Shift+O`, type filename
- **Find in project**: `⌘+Shift+F`
- **Build errors**: Check the navigator panel (left side) → Report navigator (⌘+9)
- **Console output**: Show/hide with `⌘+Shift+Y`

## Time-Saving Tips

1. **Use Code Snippets**
   - Type `init` in a struct to get initializer suggestion
   - Type `if let` to get optional binding template
   - Xcode autocomplete is your friend

2. **Copy-Paste the Boilerplate**
   - Check PROJECT_STRUCTURE.md for example code
   - Adapt the templates to your needs

3. **Test Frequently**
   - Build after each small change
   - Catch errors early
   - Don't wait until the end to test

4. **Focus on Core Features First**
   - Get basic search working
   - Add error handling after
   - Polish at the end if time permits

## Ready to Start?

1. ✅ Open `GitHubRepoSearchApp.xcodeproj`
2. ✅ Read `README.md` for requirements
3. ✅ Read `INTERVIEW_GUIDE.md` for approach
4. ✅ Check `PROJECT_STRUCTURE.md` for file details
5. ✅ Start coding!

Good luck with your interview!
