# Solution Checklist

Use this checklist to ensure you've covered all the important aspects of the implementation.

## Core Functionality
- [ ] User can search for recipes by name
- [ ] App fetches recipes from TheMealDB API
- [ ] Display list of recipe results
- [ ] Each recipe shows image, title, and basic info
- [ ] User can tap a recipe to view details
- [ ] Detail view shows full image, ingredients, and instructions
- [ ] Ingredients are properly parsed (strIngredient1-20 combined with strMeasure1-20)

## Code Organization
- [ ] Models are separated from view logic
- [ ] Networking logic is in RecipeService
- [ ] Clear separation of concerns (Model-View-ViewModel or MVC)
- [ ] Logical file structure following project template
- [ ] Appropriate use of access control (private, public, internal)
- [ ] No business logic in views/view controllers

## Error Handling
- [ ] Handle network errors (no internet connection)
- [ ] Handle API errors (server issues, rate limiting)
- [ ] Handle empty search results ("No recipes found")
- [ ] Handle JSON parsing errors
- [ ] Handle image loading failures
- [ ] Show user-friendly error messages
- [ ] Provide retry mechanism when appropriate

## UI/UX
- [ ] Loading state (spinner or progress indicator while fetching)
- [ ] Empty state (before search or when no results)
- [ ] Error state (when something goes wrong)
- [ ] Success state (showing recipe list and details)
- [ ] Search bar is functional and properly integrated
- [ ] Navigation between list and detail works smoothly
- [ ] Images load without blocking UI
- [ ] Keyboard dismisses appropriately (on search or scroll)
- [ ] Clean, readable layout
- [ ] No UI glitches or layout issues

## iOS Best Practices
- [ ] Network calls on background thread (or using async/await)
- [ ] UI updates on main thread
- [ ] No retain cycles (checked weak/unowned references)
- [ ] Proper optional handling (no force unwrapping without justification)
- [ ] No magic strings (API URLs, keys in constants)
- [ ] Reusable cells configured properly (dequeue)
- [ ] Memory-conscious image loading

## Code Quality
- [ ] Meaningful variable and function names
- [ ] Comments where logic is complex (especially ingredient parsing)
- [ ] Consistent code style and formatting
- [ ] No commented-out code in final version
- [ ] No compiler warnings
- [ ] No unnecessary duplication

## Architecture
- [ ] Clear architecture pattern (MVVM/MVC)
- [ ] Testable code structure (service layer injectable)
- [ ] Single responsibility principle
- [ ] Views only handle UI, not business logic
- [ ] Service layer is reusable and independent

## API Integration Specific
- [ ] Correctly constructs search URL with query parameters
- [ ] Handles URL encoding for search terms with spaces
- [ ] Properly decodes JSON response to Recipe model
- [ ] Handles API returning null for meals (no results)
- [ ] Handles optional fields in API response
- [ ] Parses ingredients array correctly from 20 separate fields

## Image Handling
- [ ] Images load asynchronously
- [ ] No blocking main thread during image download
- [ ] Placeholder or loading state for images
- [ ] Handles missing/broken image URLs gracefully
- [ ] For UIKit: Uses background queue for loading
- [ ] For SwiftUI: Uses AsyncImage or similar async loading

## Bonus Points
- [ ] Image caching (NSCache or third-party library)
- [ ] Pull to refresh on recipe list
- [ ] Search debouncing (delay before API call)
- [ ] Recent searches or search history
- [ ] Category filter or browse by category
- [ ] Favorite recipes with local persistence
- [ ] Unit tests for RecipeService
- [ ] Unit tests for ViewModel
- [ ] Responsive layout (works on different device sizes)
- [ ] Dark mode support
- [ ] Accessibility labels (VoiceOver support)
- [ ] Localization ready
- [ ] Custom animations or transitions

## Things to Explain During Interview

### Architecture Decisions
- [ ] Why you chose UIKit vs SwiftUI
- [ ] Why you chose MVVM vs MVC
- [ ] How you structured the networking layer
- [ ] How you decided to parse the ingredients (20 fields)
- [ ] Image loading strategy and why

### Trade-offs
- [ ] URLSession vs third-party networking libraries (Alamofire)
- [ ] Async/await vs completion handlers
- [ ] Search on every keystroke vs search button
- [ ] Simple image loading vs caching solution
- [ ] Single search endpoint vs category + details endpoints
- [ ] When to optimize vs when to keep it simple

### Improvements
- [ ] What you would add with more time
- [ ] How you would handle pagination (if API supported it)
- [ ] How you would implement favorites/persistence
- [ ] Image caching strategy for production
- [ ] Testing strategy (unit tests, UI tests)
- [ ] Performance optimizations for large lists
- [ ] Accessibility improvements

## Self-Review Questions

Before saying "I'm done", ask yourself:

### 1. Does it work?
- [ ] Did I test with multiple search terms?
- [ ] Did I test with empty search?
- [ ] Did I test with invalid/gibberish search?
- [ ] Did I test with airplane mode (no internet)?
- [ ] Did I test navigation to detail and back?
- [ ] Did I verify ingredients display correctly?

### 2. Is it maintainable?
- [ ] Can another developer understand this code?
- [ ] Is the service layer testable?
- [ ] Is it easy to add new features (e.g., favorites)?
- [ ] Are responsibilities clearly separated?

### 3. Is it production-ready?
- [ ] Are there any potential crashes?
- [ ] Did I handle all edge cases?
- [ ] Is the UX smooth and polished?
- [ ] Are loading states clear to the user?
- [ ] Do error messages help the user understand what happened?

### 4. Can I explain it?
- [ ] Can I walk through the data flow?
- [ ] Can I justify architectural decisions?
- [ ] Can I discuss what I'd do differently with more time?
- [ ] Can I explain how I parsed the ingredients?

## Interview Performance Rubric

### Excellent (Senior Level)
- ✅ Clean MVVM/MVC architecture with clear separation
- ✅ Comprehensive error handling with user feedback
- ✅ Explains trade-offs and alternatives proactively
- ✅ Code is testable and maintainable
- ✅ Handles all edge cases (empty, error, loading states)
- ✅ Properly parses complex API structure (ingredients)
- ✅ Efficient image loading (async, doesn't block UI)
- ✅ Excellent communication throughout
- ✅ Asks clarifying questions about requirements
- ✅ Discusses production considerations (caching, testing, etc.)

### Good (Mid Level)
- ✅ Working solution with reasonable structure
- ✅ Handles common errors (network, no results)
- ✅ Can explain decisions when asked
- ✅ Code is mostly clean and organized
- ✅ Covers main use cases (search, list, detail)
- ✅ Communicates clearly
- ✅ Handles basic optional unwrapping
- ✅ Shows loading states

### Needs Improvement
- ❌ Messy code organization (everything in one file)
- ❌ Missing error handling or crashes on edge cases
- ❌ Can't explain architectural decisions
- ❌ Hard-coded values and magic strings throughout
- ❌ Only handles happy path (no error/loading/empty states)
- ❌ Force unwraps optionals without checking
- ❌ Blocks main thread with network/image loading
- ❌ Poor communication or goes silent for long periods
- ❌ Doesn't parse ingredients correctly (shows raw API data)

## Specific to Recipe Finder Challenge

### Must Handle
- [ ] Ingredients come as 20 separate fields (strIngredient1-20, strMeasure1-20)
- [ ] Many ingredient slots are empty/null
- [ ] Recipe images are URLs that need async loading
- [ ] API can return null for "meals" array when no results
- [ ] Search terms with spaces need URL encoding
- [ ] Long instructions text needs scrollable view

### Common Mistakes
- [ ] ❌ Not filtering out empty ingredients (showing 20 rows with some blank)
- [ ] ❌ Force unwrapping `meals` array without checking for nil
- [ ] ❌ Loading images on main thread (UI freezes)
- [ ] ❌ Not URL encoding search query (fails on "chicken curry")
- [ ] ❌ Instructions text gets cut off (forgot scrollview)
- [ ] ❌ No loading indicator (user thinks app is broken)

### Questions You Should Ask
During the interview, you should ask:
- [ ] "Should I implement search on every keystroke or on button press?"
- [ ] "For the ingredients, should I show empty slots or filter them out?"
- [ ] "Do you want me to use the simple search endpoint or the two-step category flow?"
- [ ] "Should I focus on core functionality or include a bonus feature like favorites?"
- [ ] "Any preference on image loading approach?"

## Next Steps After Completing

### 1. Code Review (5 min)
- Read through your code as if reviewing a PR
- Look for force unwraps, magic strings, unclear naming
- Check for retain cycles (especially in closures)

### 2. Refactor (3 min)
- Extract any magic strings to constants
- Rename unclear variables
- Add comments where logic isn't obvious (ingredient parsing)

### 3. Test Edge Cases (3 min)
Try to break your app:
- Empty search → Should show empty state
- Airplane mode → Should show network error
- Search "xyz123abc" → Should show "no results"
- Navigate to detail and back → Should work smoothly
- Tap search rapidly → Should handle gracefully

### 4. Practice Explaining (2 min)
Walk through your code out loud:
- "I chose MVVM because..."
- "I'm using async/await for networking because..."
- "For the ingredients, I'm filtering the 20 fields by..."
- "In production, I would improve image loading by..."

### 5. Prepare for Common Questions
Be ready to answer:
- "Why did you choose this architecture?"
- "How would you test this code?"
- "How would you improve performance?"
- "What would you do differently with more time?"
- "How did you handle the ingredient parsing?"

## Final Checklist Before Submitting

- [ ] App runs without crashes
- [ ] Can search and see results
- [ ] Can view recipe details
- [ ] All error cases handled
- [ ] Loading states visible
- [ ] Code is organized and clean
- [ ] No compiler warnings
- [ ] Confident explaining every decision
- [ ] Tested on actual device/simulator

Good luck! 🎯
