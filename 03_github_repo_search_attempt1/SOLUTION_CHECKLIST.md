# Solution Checklist

Use this checklist before submitting your interview solution. Go through each section and verify your implementation meets the requirements.

## ✅ Core Functionality

### Search Feature
- [ ] TextField for user to enter search query
- [ ] Search button (or Enter key) triggers search
- [ ] Search text is properly captured and passed to ViewModel
- [ ] Empty search query is handled (validated before API call)

### Repository List Display
- [ ] Results display in scrollable list
- [ ] Each repository shows:
  - [ ] Repository name
  - [ ] Full name (owner/repo)
  - [ ] Description (or "No description" if null)
  - [ ] Star count
  - [ ] Programming language (or handled gracefully if null)

### API Integration
- [ ] GitHub Search API endpoint is correctly constructed
- [ ] URL includes query parameter properly encoded
- [ ] API call uses async/await pattern
- [ ] JSON response is decoded to Swift models
- [ ] Network call runs on background thread (handled by async/await)

## ✅ State Management

### Loading State
- [ ] Loading indicator (ProgressView) shows when search starts
- [ ] Loading indicator hides when results arrive or error occurs
- [ ] UI is disabled or prevents duplicate searches while loading
- [ ] isLoading property in ViewModel controls this state

### Success State
- [ ] Results array is updated when API call succeeds
- [ ] UI automatically refreshes when results change
- [ ] List displays all returned repositories
- [ ] Empty results show appropriate message ("No results found")

### Error State
- [ ] Network errors are caught and handled
- [ ] API errors (4xx, 5xx) are caught and handled
- [ ] Decoding errors are caught and handled
- [ ] Error message is displayed to user in readable format
- [ ] Error message is user-friendly (not technical stack traces)
- [ ] Previous results are cleared or kept (your choice, be consistent)

## ✅ Architecture

### MVVM Pattern
- [ ] Models are in `Models/` folder (Repository, SearchResponse, Owner)
- [ ] Service is in `Services/` folder (GitHubService)
- [ ] ViewModel is in `ViewModels/` folder (RepositorySearchViewModel)
- [ ] Views are in `Views/` folder (SearchView, RepositoryListView, RepositoryRowView)
- [ ] Clear separation of concerns (no networking code in View or ViewModel)

### Model Layer
- [ ] Models conform to `Codable` for JSON parsing
- [ ] Models conform to `Identifiable` (or have id property for List)
- [ ] CodingKeys map snake_case JSON to camelCase Swift properties
- [ ] Optional properties (description, language) are handled correctly

### Service Layer
- [ ] GitHubService class encapsulates all networking
- [ ] Service methods throw errors (don't swallow them)
- [ ] URL construction is safe (handles invalid URLs)
- [ ] HTTP status code is validated (200-299 range)
- [ ] Proper error types defined (enum ServiceError)

### ViewModel Layer
- [ ] Conforms to `ObservableObject`
- [ ] Properties are marked `@Published` for UI updates
- [ ] Uses `@MainActor` to ensure UI updates on main thread
- [ ] Calls service layer (doesn't contain networking code)
- [ ] Manages all UI state (loading, error, results)

### View Layer
- [ ] Views are in separate files (not one massive file)
- [ ] SearchView contains search UI and coordinates display
- [ ] RepositoryListView displays array of repositories
- [ ] RepositoryRowView displays single repository
- [ ] Views are properly composed (child views used in parent)
- [ ] @StateObject used for ViewModel (not @ObservedObject in root)

## ✅ Swift Best Practices

### Modern Swift Patterns
- [ ] Async/await used for networking (not completion handlers)
- [ ] Codable used for JSON parsing (not manual dictionary parsing)
- [ ] Optionals handled safely (if let, guard let, ?? nil coalescing)
- [ ] No force unwrapping (!) except for known-safe cases
- [ ] Proper use of @Published, @StateObject, @ObservedObject

### Code Quality
- [ ] Consistent naming conventions (camelCase for variables, PascalCase for types)
- [ ] No hardcoded strings repeated (consider constants if needed)
- [ ] Code is readable (meaningful variable names)
- [ ] Proper indentation and formatting
- [ ] No unused variables or commented-out code
- [ ] No compiler warnings

### Error Handling
- [ ] All throwing functions are wrapped in do-catch or try?
- [ ] Errors are propagated up (using throws) or handled locally
- [ ] User sees meaningful error messages, not raw Error descriptions
- [ ] All error paths are tested

## ✅ Edge Cases

### Input Validation
- [ ] Empty search query handled (show error or disable search)
- [ ] Whitespace-only search handled
- [ ] Special characters in search query don't break URL construction

### API Response Edge Cases
- [ ] Empty results (items = []) handled gracefully
- [ ] Null description handled (shows "No description" or similar)
- [ ] Null language handled (shows nothing or "Unknown")
- [ ] Very long descriptions don't break layout (lineLimit used)

### Network Edge Cases
- [ ] No internet connection → shows error message
- [ ] Slow network → loading indicator shows
- [ ] API rate limit hit (429 error) → shows appropriate error
- [ ] Malformed JSON → shows parsing error
- [ ] Non-200 status codes → shows error message

## ✅ UI/UX

### Visual Polish
- [ ] Search TextField has placeholder text
- [ ] Search button is clearly labeled
- [ ] Repository list is scrollable
- [ ] Star icon or visual indicator for star count
- [ ] Language displayed in distinct style (badge, pill, etc.)
- [ ] Proper spacing and padding (not cramped)
- [ ] Readable font sizes

### User Feedback
- [ ] Loading state visible (spinner or progress view)
- [ ] Error messages are red or otherwise visually distinct
- [ ] Empty state message when no results ("No results found")
- [ ] Initial state before first search (empty or instructions)

### Layout
- [ ] UI doesn't break on different screen sizes (tested on iPhone SE and Pro Max)
- [ ] Text doesn't overflow (lineLimit or truncation)
- [ ] Buttons and interactive elements are tappable size
- [ ] NavigationStack provides title and structure

## ✅ Testing (Manual)

### Happy Path
- [ ] Tested with query "swift" → returns results
- [ ] Tested with query "react" → returns results
- [ ] Results display correctly with all fields
- [ ] Can scroll through long list of results
- [ ] Searching again replaces previous results

### Unhappy Path
- [ ] Tested empty search → handled correctly
- [ ] Tested gibberish query "xyzqweasd123" → shows "No results"
- [ ] Tested with WiFi off → shows network error
- [ ] Error message is user-friendly

### Edge Cases
- [ ] Repository with no description displays correctly
- [ ] Repository with no language displays correctly
- [ ] Very long repository name doesn't break layout
- [ ] Very long description is truncated properly

## ✅ Build & Run

### Xcode Build
- [ ] Project builds without errors (⌘+B)
- [ ] No compiler warnings (or all warnings are understood/acceptable)
- [ ] All files are included in target
- [ ] Info.plist is properly configured

### Runtime
- [ ] App launches without crashes
- [ ] No runtime errors in console
- [ ] No force-unwrap crashes
- [ ] Memory usage is reasonable (no obvious leaks)

## ✅ Code Organization

### File Structure
- [ ] All files in correct folders (Models/, Services/, ViewModels/, Views/, Helpers/)
- [ ] One class/struct per file (except small related types)
- [ ] Filenames match type names (Repository.swift contains Repository)
- [ ] No dead code or unused files

### Imports
- [ ] Only necessary imports (Foundation, SwiftUI)
- [ ] No unnecessary UIKit imports
- [ ] No unused imports

## ✅ Submission Ready

### Final Checks
- [ ] Tested on iOS 17.0+ simulator
- [ ] Tested at least 3-5 different search queries
- [ ] Tested error scenarios (no network, empty search)
- [ ] Reviewed all code for obvious bugs
- [ ] Removed debug print statements or commented them out
- [ ] Code is clean and professional

### Documentation
- [ ] Code is self-explanatory (or has brief comments where needed)
- [ ] Complex logic has explanatory comments
- [ ] No TODO comments left in code (all done or removed)

### Time Check (45 minutes)
- [ ] Core functionality complete (search + display)
- [ ] Error handling implemented
- [ ] Loading states implemented
- [ ] Tested basic scenarios
- [ ] If extra time: added polish (formatting, UI improvements)

## 🎯 Interview Readiness

### Can You Explain...
- [ ] Why you chose MVVM architecture?
- [ ] How async/await works in your networking code?
- [ ] How @Published properties update the UI?
- [ ] How you handle optional values (description, language)?
- [ ] What errors can occur and how you handle them?
- [ ] How the data flows from user input → API → UI?
- [ ] What trade-offs you made due to time constraints?
- [ ] What you would add given more time?

### Code Review Ready
- [ ] Can walk through your code file by file
- [ ] Can explain purpose of each file/class
- [ ] Can explain any complex logic
- [ ] Can discuss alternative approaches you considered
- [ ] Can identify areas for improvement

## 📊 Score Yourself

### Must-Have (Pass/Fail)
- [ ] App builds and runs
- [ ] Search functionality works
- [ ] Results display correctly
- [ ] Basic error handling present
- [ ] Uses MVVM architecture

### Code Quality (Rate 1-5)
- **Architecture**: ___/5 (clear separation of concerns)
- **Swift Patterns**: ___/5 (async/await, Codable, modern Swift)
- **Error Handling**: ___/5 (comprehensive error coverage)
- **Code Clarity**: ___/5 (readable, well-named, organized)
- **UI/UX**: ___/5 (clean interface, proper states, good feedback)

### Total Assessment
- **Pass**: All must-haves + average score 3+
- **Strong Pass**: All must-haves + average score 4+
- **Fail**: Missing must-haves or average score <3

## 🚀 Ready to Submit?

If you checked most boxes above, you're ready! If not, prioritize:

1. **First Priority**: Core functionality (search + display)
2. **Second Priority**: Error handling (loading, error states)
3. **Third Priority**: Edge cases (empty results, null values)
4. **Fourth Priority**: Code quality and polish

Remember: A working basic solution is better than an incomplete advanced one!

Good luck! 🍀
