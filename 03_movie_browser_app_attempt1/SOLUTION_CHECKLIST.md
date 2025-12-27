# Solution Checklist

Use this checklist to ensure you've covered all the important aspects of the implementation.

## Core Functionality
- [ ] App displays list of popular movies
- [ ] Each movie shows poster, title, release year, and rating
- [ ] Tapping a movie navigates to detail view
- [ ] Detail view shows full information (poster, title, overview, rating, release date)
- [ ] Search bar allows searching movies by title
- [ ] Search results display in the same list format
- [ ] Clearing search returns to popular movies

## Code Organization
- [ ] Models separated from business logic (`Movie`, `MoviesResponse`)
- [ ] Networking logic in separate service layer (`MovieService`)
- [ ] State management in ViewModel (`MovieListViewModel`)
- [ ] Clear MVVM architecture pattern
- [ ] Logical file structure (Models/, Services/, ViewModels/, Views/, Helpers/)
- [ ] Appropriate use of access control (private, public)

## Error Handling
- [ ] Handle network errors (no internet connection)
- [ ] Handle API errors (invalid API key, rate limiting, server errors)
- [ ] Handle JSON parsing errors
- [ ] Handle empty search results
- [ ] Handle image loading failures
- [ ] Show user-friendly error messages via alerts

## UI/UX
- [ ] Loading state shown when fetching movies (ProgressView)
- [ ] Empty state when no movies loaded yet
- [ ] Error state with clear message
- [ ] Search bar is easy to find and use
- [ ] Images load properly with placeholders
- [ ] Navigation feels smooth (push/pop)
- [ ] Layout is clean and readable
- [ ] Handles different screen sizes

## iOS Best Practices
- [ ] Network calls use async/await
- [ ] No blocking of main thread
- [ ] Proper use of @Observable or @Published for reactive updates
- [ ] No retain cycles (check @MainActor usage)
- [ ] Proper optional handling (no unsafe force unwraps)
- [ ] Constants for API endpoints and keys
- [ ] No magic strings or numbers

## Code Quality
- [ ] Meaningful variable and function names
- [ ] Comments where logic is complex
- [ ] Consistent code style
- [ ] No commented-out code in final version
- [ ] No compiler warnings
- [ ] Proper use of CodingKeys for JSON mapping

## Architecture
- [ ] Clear MVVM pattern implementation
- [ ] Testable code structure (service and ViewModel are unit-testable)
- [ ] Single responsibility principle followed
- [ ] Views are purely for UI rendering
- [ ] Business logic in ViewModel, not in Views

## API Integration
- [ ] Correct endpoints used (popular movies, search)
- [ ] Query parameters properly encoded
- [ ] Image URLs constructed correctly
- [ ] Handles API pagination structure (even if not implementing pagination)
- [ ] Can toggle between mock and real API data

## Bonus Points
- [ ] Unit tests for MovieService
- [ ] Unit tests for MovieListViewModel
- [ ] Pull to refresh functionality
- [ ] Pagination/infinite scrolling
- [ ] Image caching implementation
- [ ] Debounced search (doesn't search on every keystroke)
- [ ] Favorites/bookmarking with persistence
- [ ] Custom animations
- [ ] Accessibility labels
- [ ] Dark mode support
- [ ] Shimmer loading effect for images

## Things to Explain During Interview

### Architecture Decisions
- [ ] Why MVVM is appropriate for this app
- [ ] Why you used singleton vs dependency injection for service
- [ ] How you structured the model layer (response vs domain model)
- [ ] Why async/await over completion handlers

### Trade-offs
- [ ] AsyncImage vs custom image loader (caching trade-offs)
- [ ] Singleton service vs injected dependency
- [ ] Mock data strategy for development
- [ ] When to split ViewModels (list vs detail)
- [ ] Pagination trade-offs (complexity vs UX)

### Improvements
- [ ] How you would implement pagination
- [ ] How you would add image caching
- [ ] How you would persist favorites
- [ ] How you would add unit tests
- [ ] How you would handle offline mode
- [ ] How you would improve search (filters, sorting)

## Self-Review Questions

Before saying "I'm done", ask yourself:

1. **Does it work?**
   - Did I test loading popular movies?
   - Did I test searching for movies?
   - Did I test navigation to detail view?
   - Did I test error scenarios (bad search, network off)?
   - Did I test with both mock and real API data?

2. **Is it maintainable?**
   - Can another developer understand my code?
   - Is it easy to add new features (e.g., favorites)?
   - Is it easy to test?
   - Are my models decoupled from views?

3. **Is it production-ready?**
   - Are there any crashes waiting to happen?
   - Did I handle all edge cases?
   - Is the UX smooth and polished?
   - Did I test on different devices/screen sizes?

4. **Can I explain it?**
   - Can I walk through the entire data flow?
   - Can I justify my architectural decisions?
   - Can I discuss alternative approaches?
   - Can I explain what I'd do differently with more time?

## Interview Performance Rubric

### Excellent (Senior Level)
- Clean MVVM architecture with clear boundaries
- Comprehensive error handling with user-friendly messages
- Explains trade-offs between different approaches
- Code is highly testable and maintainable
- Handles edge cases proactively
- Smooth, polished UI/UX
- Discusses scalability and performance
- Excellent communication throughout

### Good (Mid Level)
- Working solution with decent structure
- Handles common errors appropriately
- Can explain decisions when prompted
- Code is organized and mostly clean
- Covers main use cases
- UI is functional and clear
- Communicates clearly

### Needs Improvement
- Messy or unclear architecture
- Missing error handling
- Can't explain decisions
- Hard-coded values everywhere
- Only handles happy path
- Clunky or confusing UI
- Poor communication or long silent periods

## Specific Gotchas for This Challenge

### JSON Parsing
- [ ] Did you handle snake_case to camelCase mapping? (poster_path → posterPath)
- [ ] Did you handle optional fields properly? (backdrop_path may be null)
- [ ] Did you handle the nested "results" array?

### Image URLs
- [ ] Did you construct full image URLs correctly? (base + size + path)
- [ ] Did you handle missing poster paths? (some movies don't have posters)
- [ ] Did you choose appropriate image size? (w500 is good for lists)

### Search
- [ ] Did you handle empty search strings?
- [ ] Did you trim whitespace from search input?
- [ ] Did you show appropriate message for no results?
- [ ] Did you clear search results when search is cleared?

### Navigation
- [ ] Did you pass the selected movie to detail view?
- [ ] Did detail view display all required information?
- [ ] Does back navigation work properly?

## Next Steps After Completing

1. **Review your code** - Read through as if reviewing a pull request
2. **Refactor** - Clean up anything that looks messy or repetitive
3. **Test edge cases** - Try to break your app
4. **Practice explaining** - Walk through your code out loud
5. **Time yourself** - Can you complete it in 60 minutes?
6. **Consider improvements** - What would you add with more time?

## Quick Reference: Common Interview Questions

**Q: "Why did you choose MVVM?"**
A: "MVVM separates concerns cleanly in SwiftUI. Views are purely declarative, ViewModels handle business logic and state, and Models represent data. This makes the code testable and maintainable."

**Q: "How would you add pagination?"**
A: "I'd track the current page in the ViewModel, detect when the user scrolls near the bottom of the list, fetch the next page, and append results to the existing array. I'd also need to prevent duplicate requests."

**Q: "How would you improve image loading?"**
A: "I'd use a library like Kingfisher or SDWebImage for better caching, or implement a custom cache using NSCache. This would reduce network calls and improve performance, especially on slower connections."

**Q: "How would you test this code?"**
A: "I'd write unit tests for MovieService (using mock URLSession), unit tests for MovieListViewModel (using mock service), and UI tests for critical user flows like search and navigation."

**Q: "What would you do differently for a production app?"**
A: "I'd add proper error tracking (Crashlytics), analytics, more robust offline support, accessibility labels, localization, performance monitoring, and comprehensive test coverage."

Good luck! 🎬
