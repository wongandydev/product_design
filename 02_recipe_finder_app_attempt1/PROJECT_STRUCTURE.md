# Project Structure

```
02_recipe_finder_app_attempt1/
├── README.md                          # Main project requirements and API documentation
├── INTERVIEW_GUIDE.md                 # How to approach the interview
├── SOLUTION_CHECKLIST.md              # What to verify before submitting
├── PROJECT_STRUCTURE.md               # This file
│
└── RecipeApp/
    ├── Models/
    │   └── RecipeModel.swift          # Data models (TODO: implement)
    │
    ├── Services/
    │   └── RecipeService.swift        # Networking layer (TODO: implement)
    │
    ├── ViewControllers/
    │   ├── RecipeListViewController.swift    # UIKit list view (TODO: implement)
    │   └── RecipeDetailViewController.swift  # UIKit detail view (TODO: implement)
    │
    └── SwiftUI/
        ├── RecipeListView.swift       # SwiftUI list view (TODO: implement)
        ├── RecipeDetailView.swift     # SwiftUI detail view (TODO: implement)
        └── RecipeViewModel.swift      # SwiftUI view model (TODO: implement)
```

## Getting Started

1. **Read README.md** - Understand the requirements and API structure
2. **Read INTERVIEW_GUIDE.md** - Learn how to approach the problem
3. **Choose your approach** - UIKit or SwiftUI
4. **Start implementing** - Follow the recommended order below
5. **Use SOLUTION_CHECKLIST.md** - Verify completeness before finishing

## File Descriptions

### Models/RecipeModel.swift
Define your data structures here:
- `RecipeResponse` - Wrapper for API response with meals array
- `Recipe` - Main recipe model matching API JSON structure
- Use `Codable` for automatic JSON parsing
- Add computed properties for clean data (e.g., ingredients array from strIngredient1-20)
- Consider creating a separate `Ingredient` struct if needed

**Key considerations:**
- API returns ingredients as `strIngredient1` through `strIngredient20`
- Need to parse and combine with corresponding `strMeasure1` through `strMeasure20`
- Many fields are optional - handle with proper optionals

### Services/RecipeService.swift
Implement networking here:
- API endpoint construction
- URLSession configuration and requests
- Async/await or completion handler pattern
- Error handling (network errors, parsing errors)
- Response validation

**Methods to implement:**
```swift
// Search recipes by name
func searchRecipes(query: String) async throws -> [Recipe]

// Get recipe details by ID (if using two-step flow)
func getRecipeDetails(id: String) async throws -> Recipe

// Optional: Get recipes by category
func getRecipesByCategory(category: String) async throws -> [Recipe]
```

### ViewControllers/RecipeListViewController.swift (UIKit)
Build your list UI here:
- UITableView or UICollectionView setup
- UISearchBar or UISearchController integration
- Cell configuration with image, title, category
- Navigation to detail view
- Loading indicator (UIActivityIndicatorView)
- Error alert display
- Empty state handling

**Responsibilities:**
- Display recipes in a scrollable list
- Handle user search input
- Show loading state while fetching
- Handle tap to navigate to detail
- Manage table view data source and delegate

### ViewControllers/RecipeDetailViewController.swift (UIKit)
Build your detail UI here:
- UIScrollView for content (long instructions)
- Recipe image display (large format)
- Title, category, area labels
- Ingredients list (UIStackView or UITableView)
- Instructions text view
- Additional metadata (servings, cook time, etc.)

### SwiftUI/RecipeListView.swift (SwiftUI)
Alternative SwiftUI implementation:
- `List` or `LazyVStack` for recipe display
- `.searchable()` modifier for search bar
- `NavigationStack` for navigation
- `AsyncImage` for image loading (or custom ImageLoader)
- Loading view with `ProgressView`
- Error view with retry button
- Empty state view

**Structure:**
```swift
struct RecipeListView: View {
    @StateObject private var viewModel = RecipeViewModel()

    var body: some View {
        NavigationStack {
            // List of recipes
            // Loading state
            // Error state
            // Empty state
        }
        .searchable(text: $viewModel.searchText)
    }
}
```

### SwiftUI/RecipeDetailView.swift (SwiftUI)
Alternative SwiftUI detail view:
- `ScrollView` for long content
- `AsyncImage` for large recipe image
- `VStack` layout for organized sections
- Ingredients section with `ForEach`
- Instructions section
- Metadata display

### SwiftUI/RecipeViewModel.swift (SwiftUI)
State management for SwiftUI:
- Conforms to `ObservableObject`
- `@Published` properties for state
- Handles RecipeService calls
- Manages loading, error, and success states
- Search text handling

**Properties:**
```swift
@Published var recipes: [Recipe] = []
@Published var isLoading: Bool = false
@Published var errorMessage: String?
@Published var searchText: String = ""
```

## Choose Your Path

### Option 1: UIKit (Traditional)
- Use `RecipeListViewController` and `RecipeDetailViewController`
- Programmatic UI or Storyboards (your choice)
- Delegates/closures for callbacks
- UITableView for list display
- Manual Auto Layout or stack views

**When to choose UIKit:**
- More comfortable with UIKit
- Want to demonstrate knowledge of delegates and manual layout
- Interview team works primarily with UIKit

### Option 2: SwiftUI (Modern)
- Use `RecipeListView`, `RecipeDetailView`, and `RecipeViewModel`
- Declarative UI syntax
- `@StateObject` and `@Published` for state management
- `NavigationStack` and `NavigationLink` for navigation
- MVVM pattern fits naturally

**When to choose SwiftUI:**
- More comfortable with SwiftUI
- Want to demonstrate modern iOS development
- Want to write less boilerplate code

## Implementation Order (Recommended)

### 1. Models First (5-10 min)
Start here because models define your data structure:
```
RecipeModel.swift
├── Create RecipeResponse struct
├── Create Recipe struct with Codable
├── Add computed property for ingredients
└── Test with sample JSON
```

### 2. Service Layer (10-15 min)
Build networking foundation:
```
RecipeService.swift
├── Create search method
├── Build URL with query parameters
├── Fetch data with URLSession
├── Decode JSON with JSONDecoder
└── Handle errors with Result or throws
```

### 3. List View (15-20 min)
Main user interface:
```
RecipeListView[Controller].swift
├── Setup list/table view
├── Add search bar
├── Connect to RecipeService
├── Display results with images
├── Add loading indicator
└── Handle navigation to detail
```

### 4. Detail View (10-15 min)
Show full recipe information:
```
RecipeDetailView[Controller].swift
├── Accept Recipe object
├── Display large image
├── Show title and metadata
├── Parse and display ingredients
└── Display instructions
```

### 5. Polish & Testing (5-10 min)
- Add error handling UI
- Add empty state
- Test edge cases
- Clean up code

## Tips

### Data Flow
```
User Input (Search)
    ↓
ViewModel/ViewController validates
    ↓
Call RecipeService
    ↓
RecipeService makes API request
    ↓
Parse JSON to Recipe objects
    ↓
Update UI with results
```

### Error Handling Strategy
Handle these error cases:
1. **Network Error** - No internet connection
2. **API Error** - Server returned error
3. **Parsing Error** - JSON doesn't match model
4. **Empty Results** - No recipes found for search
5. **Invalid Input** - Empty search query

### Image Loading Strategy
**Basic approach (fine for interview):**
- Use `URLSession.shared.data(from:)` with async/await
- Load on background thread, update UI on main thread
- For SwiftUI, use `AsyncImage` built-in

**Production approach (mention in discussion):**
- Implement `NSCache` to cache downloaded images
- Use a library like Kingfisher or SDWebImage
- Handle placeholder images and loading states
- Memory management for large images

### Ingredient Parsing Strategy
The API returns:
```json
{
  "strIngredient1": "Chicken",
  "strMeasure1": "1 whole",
  "strIngredient2": "Lime",
  "strMeasure2": "2",
  ...
  "strIngredient20": null,
  "strMeasure20": null
}
```

**Approach:**
```swift
var ingredients: [(ingredient: String, measure: String)] {
    var result: [(String, String)] = []
    let mirror = Mirror(reflecting: self)

    for i in 1...20 {
        // Use key path or mirror to access strIngredient{i} and strMeasure{i}
        // Filter out empty/null values
        // Combine into tuple
    }

    return result
}
```

## Common Pitfalls

- **Not filtering empty ingredients** - API has 20 slots but most recipes use 5-10
- **Blocking main thread** - Load images on background thread
- **No loading state** - User sees blank screen while fetching
- **No error feedback** - App fails silently
- **Force unwrapping** - Crash on unexpected nil values
- **Mixing concerns** - Putting networking code in view controller
- **No separation** - One massive view controller doing everything

## Success Criteria

By the end, you should have:
- ✅ Working search functionality
- ✅ List of recipes with images
- ✅ Detailed recipe view with ingredients and instructions
- ✅ Proper error handling
- ✅ Loading states
- ✅ Clean, organized code
- ✅ Can explain your architectural decisions

## Questions to Ask

Before you start coding:
1. Should I support both search by name and filter by category?
2. Do you want the two-step flow (list → fetch details) or single search endpoint?
3. Any preference on image loading approach?
4. Should I add any bonus features or focus on core functionality?
5. Is there a preferred way to handle the 20 ingredient fields?
