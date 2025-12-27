# Interview Guide - Recipe Finder App Challenge

## How to Approach This Interview

### Phase 1: Understanding (5 minutes)
**Read the requirements and ask clarifying questions:**
- Should I implement both search and category browsing, or just search?
- Do you want a master-detail flow (list → detail) or just the list?
- Should I use the simplified list endpoint or the full search endpoint?
- UIKit or SwiftUI preference?
- Any specific architectural pattern you want to see? (MVC, MVVM, etc.)
- Should I handle the ingredient/measure parsing (they come as separate fields strIngredient1-20, strMeasure1-20)?

### Phase 2: Planning (5-10 minutes)
**Think out loud and explain your approach:**

1. **Architecture Decision**
   - "I'll use MVVM because it separates presentation logic from the view"
   - "I'll create a RecipeService for networking and a RecipeViewModel to manage state"
   - "For UIKit, I'll use UITableView for the list and a detail view controller for recipe details"
   - OR "For SwiftUI, I'll use a NavigationStack with List and a detail view"

2. **Identify Core Components**
   - **Models**: Recipe struct (Codable for API parsing)
   - **Service**: RecipeService (handles API calls)
   - **ViewModels**: RecipeListViewModel, RecipeDetailViewModel (if MVVM)
   - **Views**: RecipeListView/ViewController, RecipeDetailView/ViewController
   - **Helpers**: ImageLoader or image caching utility (bonus)

3. **Plan Implementation Order**
   - "I'll start with the Recipe model to match the API response"
   - "Then build the RecipeService to test the API integration"
   - "Next, create the list view with search"
   - "Finally, add the detail view and navigation"
   - "If time permits, I'll add image caching and error handling improvements"

4. **Data Flow**
   - User types in search → ViewModel calls Service → Service fetches from API → Parse JSON → Update UI

### Phase 3: Implementation (30-40 minutes)

#### Start with Models (5-10 min)
```swift
// Example thought process:
// "Looking at the API response, I see meals is an array of recipe objects"
// "Each recipe has an ID, name, thumbnail, category, instructions, and 20 possible ingredients"
// "I'll create a Recipe struct that conforms to Codable"
// "For ingredients, I'll parse strIngredient1-20 and strMeasure1-20 into a clean array"

struct RecipeResponse: Codable {
    let meals: [Recipe]?
}

struct Recipe: Codable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String?
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?

    // Ingredients 1-20
    let strIngredient1: String?
    let strMeasure1: String?
    // ... (explain you'd continue to 20)

    var id: String { idMeal }

    // Computed property to get clean ingredients list
    var ingredients: [(ingredient: String, measure: String)] {
        // Logic to filter out empty strings and combine ingredient + measure
    }
}
```

#### Build Service Layer (10-15 min)
```swift
// Example thought process:
// "I'll create a RecipeService class to handle all API calls"
// "I'll use async/await for cleaner async code (or completion handlers if more comfortable)"
// "I'll use Result type to handle success and error cases"
// "I'll make the API URL construction flexible for different endpoints"

class RecipeService {
    private let baseURL = "https://www.themealdb.com/api/json/v1/1"

    func searchRecipes(query: String) async throws -> [Recipe] {
        // Construct URL with query parameter
        // Use URLSession to fetch data
        // Decode JSON using JSONDecoder
        // Return recipes array
        // Throw errors for network or parsing failures
    }

    func getRecipeDetails(id: String) async throws -> Recipe {
        // Similar pattern for detail endpoint
    }
}
```

#### Create List View (15-20 min)
```swift
// UIKit approach:
// "I'll use UITableView with a search controller"
// "Each cell will show thumbnail, title, and category"
// "I'll use URLSession to load images asynchronously"
// "I'll show a loading spinner while fetching results"

// SwiftUI approach:
// "I'll use a List with NavigationStack"
// "I'll use @StateObject for the ViewModel"
// "I'll use AsyncImage for simple image loading"
// "I'll handle loading state with a ProgressView"
```

#### Add Detail View (10-15 min)
```swift
// "When user taps a recipe, navigate to detail view"
// "Pass the Recipe object to the detail view"
// "Display the full image, instructions, and ingredients list"
// "For UIKit, I'll use a UIScrollView to handle long content"
// "For SwiftUI, I'll use a ScrollView with VStack"
```

### Phase 4: Testing & Polish (5-10 minutes)
- Test with various search terms ("chicken", "a", "")
- Test error scenarios (airplane mode, invalid search)
- Add loading indicators
- Add empty state ("No recipes found")
- Clean up code and add comments where needed

## Common Interview Talking Points

### 1. Image Loading
**Bad**: Load images on main thread, no caching, blocking UI
**Good**: "I'm loading images asynchronously on a background thread. In production, I'd use a library like Kingfisher or SDWebImage, or implement a simple cache using NSCache to avoid re-downloading images."

### 2. Parsing Ingredients
**Bad**: Ignore the ingredient fields or hardcode indexes
**Good**: "The API returns ingredients as strIngredient1 through strIngredient20 with corresponding measures. I'll iterate through these using a loop, filter out empty values, and combine them into a clean array of tuples or a custom Ingredient struct."

### 3. Error Handling
**Bad**: Silent failures or generic alerts
**Good**: "I'm handling three main error cases: network failure (no internet), API errors (server issues), and no results (invalid search). Each shows a specific message to help the user understand what happened."

### 4. Architecture
**Bad**: All logic in view controller
**Good**: "I'm using MVVM to separate concerns. The ViewModel handles business logic and API calls, the Service handles networking, and the View only handles UI updates and user interaction."

### 5. Navigation
**Bad**: Present modally without dismiss option
**Good**: "I'm using navigation controller's push/pop for a natural back button. Alternatively in SwiftUI, I'm using NavigationLink which handles the navigation stack automatically."

## Key Topics You Should Be Ready to Discuss

### Networking
- URLSession basics (dataTask vs modern async/await)
- Error handling (URLError, decoding errors)
- Query parameter encoding
- Response validation
- Testing network code (dependency injection, mock services)

### UI
- UITableView vs UICollectionView (when to use each)
- Cell reuse and dequeue
- SwiftUI List performance
- Image loading performance
- Scrolling performance with images
- Search bar integration (UISearchController vs SwiftUI searchable)

### Data Parsing
- Codable protocol
- Custom CodingKeys
- Handling optional fields
- Handling dynamic keys (ingredients 1-20)
- Transforming API models to app models

### Architecture
- MVVM pattern (ViewModel responsibilities)
- Service layer separation
- Repository pattern (optional bonus)
- Dependency injection for testing
- State management (@Published, @State, Observable)

### Swift Language Features
- Optionals (safe unwrapping vs force unwrapping)
- Async/await vs completion handlers
- Result type for error handling
- Computed properties
- Property wrappers (@Published, @State, etc.)

## Example Dialogue

**Interviewer**: "Let's start by implementing the recipe search feature."

**You**: "Great! Let me first clarify a few things. Looking at the API documentation, I see there are multiple endpoints - one for searching by name and one for filtering by category. For this interview, should I focus on search by name, or would you like both?

Also, I notice the API returns a simplified response for category filtering that only includes ID, name, and thumbnail, which requires a second call to get full details. Should I implement that two-step flow, or stick with the search endpoint that returns complete data?

Assuming we're focusing on search by name, here's my approach:

I'll use MVVM architecture with three main layers:
1. **Model layer**: Recipe struct conforming to Codable to parse the API response
2. **Service layer**: RecipeService to handle API calls using URLSession with async/await
3. **View layer**: A list view with search bar, and a detail view for displaying full recipe info

The data flow will be: User enters search term → ViewModel validates input → Calls RecipeService → Service makes API request → Parse JSON → Update UI with results.

I'll also handle three states: loading (show spinner), success (show results), and error (show error message).

One challenge with this API is that ingredients come as separate fields (strIngredient1 through strIngredient20). I'll parse these into a clean array by filtering out null/empty values.

Does this approach sound good, or would you like me to focus on a different aspect first?"

**Interviewer**: "That sounds great, go ahead."

**You**: "Perfect. Let me start by creating the Recipe model. I'll begin by modeling the API response structure..."

## Time Management Tips

- **0-5 min**: Ask questions, understand requirements, clarify API
- **5-15 min**: Explain architecture, plan components, discuss approach
- **15-30 min**: Implement models, service, and list view
- **30-45 min**: Add detail view, navigation, and basic error handling
- **45-55 min**: Polish UI, test edge cases, add loading states
- **55-60 min**: Code review, discuss improvements, answer questions

## Red Flags to Avoid

- Not asking about the ingredient parsing strategy (it's tricky!)
- Ignoring error states completely
- Not showing loading states
- Force unwrapping without checking
- Putting all logic in the view controller
- Not explaining your thought process
- Hardcoding API URLs in views
- Not considering image loading performance
- Skipping navigation entirely
- Not testing with actual API

## Green Flags to Demonstrate

- Asking about the two-step API flow (list vs detail)
- Mentioning image caching concerns early
- Discussing the ingredient parsing challenge
- Clean separation of networking and UI code
- Proper optional handling
- Showing awareness of main thread vs background thread
- Discussing trade-offs (e.g., "I'm using simple URLSession now, but would use Kingfisher in production")
- Testing as you go (run the app periodically)
- Explaining each architectural decision
- Thinking about edge cases (empty search, no results, no internet)

## Specific Challenges in This Project

### Challenge 1: Parsing 20 Ingredient Fields
The API returns ingredients as:
```json
{
  "strIngredient1": "Chicken",
  "strMeasure1": "1 whole",
  "strIngredient2": "Tomato",
  "strMeasure2": "2 chopped",
  ...
  "strIngredient20": "",
  "strMeasure20": ""
}
```

**Discuss your approach:**
- "I could manually check each field, but that's error-prone"
- "I'll use a loop from 1-20 and use key path or mirror to access dynamic properties"
- "I'll filter out empty strings and combine ingredient + measure into tuples"

### Challenge 2: Image Loading Performance
**Discuss your approach:**
- "Loading images synchronously would block the UI and cause stuttering"
- "I'll use URLSession.shared.data(from:) on background thread"
- "For production, I'd implement NSCache to cache downloaded images"
- "Or use a library like Kingfisher which handles caching, placeholder, and memory management"

### Challenge 3: Search UX
**Discuss your approach:**
- "Should I search on every keystroke or wait for user to press 'search'?"
- "Searching on every keystroke is better UX but more API calls"
- "I could add debouncing (wait 0.3s after user stops typing) to reduce API calls"
- "For this interview, I'll trigger search on button press to keep it simple"

Good luck!
