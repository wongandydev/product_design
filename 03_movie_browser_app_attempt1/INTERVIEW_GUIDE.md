# Interview Guide - Movie Browser App Challenge

## How to Approach This Interview

### Phase 1: Understanding (5 minutes)
**Read the requirements and ask clarifying questions:**
- Should I fetch real data from TMDB API or use mock data?
- Do you want pagination/infinite scroll, or just the first page?
- Should the detail view be a modal or push navigation?
- Any specific image loading approach? (AsyncImage, custom, caching?)
- Do I need to handle favorites or just display movies?
- What error states should I prioritize?

### Phase 2: Planning (5-10 minutes)
**Think out loud and explain your approach:**

1. **Architecture Decision**
   - "I'll use MVVM architecture with SwiftUI"
   - "Models will handle data structure, Service handles API calls, ViewModel manages state"
   - "This keeps business logic separate from views and makes testing easier"

2. **Identify Core Components**
   - Models (`Movie`, `MoviesResponse`)
   - Service layer (`MovieService` for API calls)
   - ViewModels (`MovieListViewModel` for state management)
   - Views (`MovieListView`, `MovieDetailView`, `MovieRowView`)
   - Helpers (`MockData` for testing)

3. **Plan Implementation Order**
   - "I'll start with the models to match the API response"
   - "Then implement the service layer with async/await"
   - "Build the ViewModel to coordinate data flow"
   - "The views are already functional, so I'll just wire them up"
   - "Finally add error handling and polish"

### Phase 3: Implementation (30-40 minutes)
**Code while explaining your decisions:**

#### Start with Models (10 minutes)
```swift
// Example thought process:
// "Looking at the TMDB API response, I need two models:"
// "1. MoviesResponse - the wrapper with pagination info"
// "2. Movie - individual movie data"
// "I'll use Codable for automatic JSON parsing"
// "poster_path needs snake_case mapping to posterPath in Swift"
```

#### Build Service Layer (15 minutes)
```swift
// Example thought process:
// "I'll create a MovieService singleton for API calls"
// "Using async/await instead of completion handlers for cleaner code"
// "I need two endpoints: popular movies and search"
// "I'll handle construction of image URLs in the service"
// "Error handling will use custom NetworkError enum"
```

#### Implement ViewModel (10 minutes)
```swift
// Example thought process:
// "ViewModel will use @Published for reactive updates"
// "I need state for: movies array, loading, error, search text"
// "loadPopularMovies will be called in onAppear"
// "searchMovies will debounce user input to avoid excessive API calls"
```

#### Wire Up Views (5 minutes)
```swift
// Example thought process:
// "Views are already built, I just need to connect them to ViewModel"
// "AsyncImage handles poster loading automatically"
// "Navigation is already set up with NavigationStack"
```

### Phase 4: Testing & Polish (5-10 minutes)
- Test with mock data first
- Test with real API (if available)
- Test search functionality
- Test navigation flow
- Add loading states
- Add empty state handling
- Test error scenarios

## Common Interview Talking Points

### 1. Error Handling
**Bad**: Silently fail or crash when API fails
**Good**: "I'm handling multiple error cases: network failure, no results, invalid API key, and parsing errors. Each shows a user-friendly alert message."

### 2. Architecture
**Bad**: Put all logic in views
**Good**: "I'm using MVVM - Movie models represent data, MovieService handles networking, MovieListViewModel manages state, and views just render UI reactively."

### 3. Async Operations
**Bad**: Use completion handlers inconsistently, block main thread
**Good**: "I'm using async/await for clean asynchronous code. Network calls happen off the main thread, but all @Published property updates trigger UI changes on the main actor automatically."

### 4. Image Loading
**Bad**: Manually download images and block UI
**Good**: "I'm using SwiftUI's AsyncImage which handles downloading, caching, and placeholder states automatically. For production, I might add a custom caching layer with Kingfisher or SDWebImage."

### 5. State Management
**Bad**: Use @State for everything, lose data on view dismissal
**Good**: "I'm using @Observable for the ViewModel so it persists across view updates. Movies array is in the ViewModel, not the view, so data survives navigation."

## Key Topics You Should Be Ready to Discuss

### SwiftUI Specifics
- @State vs @Observable vs @Published
- NavigationStack vs NavigationView
- List performance with large datasets
- AsyncImage vs custom image loading
- @MainActor for UI updates

### Networking
- async/await vs completion handlers
- URLSession data tasks
- Error handling with Result type
- Request construction and query parameters
- Response parsing with Codable

### Architecture
- MVVM pattern in SwiftUI
- Separation of concerns
- Dependency injection vs singletons
- Testability of ViewModels
- When to split ViewModels

### Data Flow
- Unidirectional data flow
- When to use @Published
- Binding vs direct state mutation
- Passing data between views
- State persistence

### UI/UX Considerations
- Loading states and progress indicators
- Empty states (no results, no search)
- Error states and user feedback
- Pull to refresh
- Infinite scrolling/pagination

## Example Dialogue

**Interviewer**: "Let's start by implementing the movie list loading."

**You**: "Sure! Let me walk through my approach. First, I need to understand the TMDB API structure. Looking at the documentation, I see that `/movie/popular` returns a JSON object with a 'results' array containing movie objects.

I'll create two models: `MoviesResponse` for the outer wrapper and `Movie` for individual items. Both will conform to Codable for automatic JSON parsing.

For the service layer, I'll use a singleton pattern since we only need one instance managing API calls. I'll implement `fetchPopularMovies()` using async/await for cleaner code than completion handlers.

The ViewModel will call this service method, handle the response, and update the `@Published movies` array. SwiftUI will automatically re-render the list when this changes.

One thing to consider: should I implement pagination now, or just fetch the first page? For this interview, I'll focus on getting the first page working, but I can explain how I'd add pagination as a bonus feature.

Let me start coding the models first..."

## Time Management Tips

- **0-5 min**: Ask questions, clarify requirements
- **5-15 min**: Explain architecture, plan approach, sketch out models
- **15-35 min**: Implement models, service, ViewModel
- **35-45 min**: Wire up views, add error handling
- **45-55 min**: Test all flows, polish UI
- **55-60 min**: Discuss improvements and trade-offs

## Red Flags to Avoid

- Starting to code without planning
- Not handling errors or loading states
- Ignoring the mock data provided for testing
- Force unwrapping optionals without explanation
- Not explaining your thought process
- Over-engineering (implementing full pagination when basic list is needed first)
- Going silent for long periods
- Not testing your code as you go

## Green Flags to Demonstrate

- Clear explanation of MVVM architecture
- Asking about API rate limits and error cases
- Starting with mock data, then switching to real API
- Discussing image caching strategies
- Mentioning accessibility considerations
- Awareness of memory management with images
- Discussing testing strategy for async code
- Proactive error handling
- Clean, consistent code style
- Explaining trade-offs (e.g., pagination vs simple list)

## Bonus Points

If you finish early, consider discussing or implementing:
- "How would you implement pagination?"
- "How would you cache images for offline viewing?"
- "How would you add unit tests for the ViewModel?"
- "How would you handle favorites persistence?"
- "How would you improve search performance with debouncing?"
- "How would you handle very slow network connections?"
