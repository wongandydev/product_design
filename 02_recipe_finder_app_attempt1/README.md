# iOS Interview Challenge: Recipe Finder App

## Overview
Build a recipe search application that allows users to search for recipes and view detailed cooking instructions.

## Time Allocation
- **In-person interview**: 45-60 minutes
- **Take-home**: 2-3 hours

## Requirements

### Core Features (Must Have)
1. **Search Functionality**
   - User can search for recipes by name or ingredient
   - Display search results in a list or grid
   - Show recipe thumbnail, title, and basic info in results

2. **Recipe List Display**
   - Show multiple recipes in scrollable list
   - Each item should display:
     - Recipe image
     - Recipe title
     - Cook time or servings (if available)

3. **Recipe Detail View**
   - Navigate to detail screen when user taps a recipe
   - Display:
     - Full-size recipe image
     - Recipe title
     - Ingredients list
     - Cooking instructions
     - Additional metadata (prep time, servings, etc.)

4. **API Integration**
   - Use TheMealDB API (free, no key required)
   - Handle network requests properly
   - Parse JSON response
   - Handle asynchronous data loading

### Technical Requirements
- Use UIKit or SwiftUI (your choice)
- Follow iOS best practices and design patterns
- Handle loading states (show spinner while fetching)
- Handle error states (no internet, API failure, no results found)
- Clean, readable code with proper naming conventions
- Efficient image loading (avoid blocking main thread)

### Bonus Features (Nice to Have)
- Image caching for better performance
- Pull to refresh
- Favorite recipes (save locally)
- Filter by category (dessert, seafood, vegetarian, etc.)
- Search history
- Unit tests
- Responsive layout for iPad
- Custom animations

## What We're Evaluating
1. **Code Organization** - Proper separation of concerns, clear architecture
2. **Error Handling** - Edge cases, network failures, user feedback
3. **UI/UX** - Clean interface, loading states, smooth scrolling
4. **Communication** - Ability to explain your decisions and trade-offs
5. **iOS Fundamentals** - Proper use of iOS patterns and frameworks
6. **Image Handling** - Efficient loading and display of images

## API Information

### TheMealDB API (Free - No API Key Required)

#### Search by Name
- **Endpoint**: `https://www.themealdb.com/api/json/v1/1/search.php?s={query}`
- **Example**: `https://www.themealdb.com/api/json/v1/1/search.php?s=chicken`

#### Search by First Letter
- **Endpoint**: `https://www.themealdb.com/api/json/v1/1/search.php?f={letter}`
- **Example**: `https://www.themealdb.com/api/json/v1/1/search.php?f=a`

#### List All Categories
- **Endpoint**: `https://www.themealdb.com/api/json/v1/1/categories.php`

#### Filter by Category
- **Endpoint**: `https://www.themealdb.com/api/json/v1/1/filter.php?c={category}`
- **Example**: `https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood`

#### Get Recipe Details by ID
- **Endpoint**: `https://www.themealdb.com/api/json/v1/1/lookup.php?i={id}`
- **Example**: `https://www.themealdb.com/api/json/v1/1/lookup.php?i=52772`

### Sample API Response (Search)
```json
{
  "meals": [
    {
      "idMeal": "52940",
      "strMeal": "Brown Stew Chicken",
      "strCategory": "Chicken",
      "strArea": "Jamaican",
      "strInstructions": "Squeeze lime over chicken and rub well...",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/sypxpx1515365095.jpg",
      "strTags": "Stew",
      "strYoutube": "https://www.youtube.com/watch?v=...",
      "strIngredient1": "Chicken",
      "strMeasure1": "1 whole",
      "strIngredient2": "Tomato",
      "strMeasure2": "2 chopped",
      ...
    }
  ]
}
```

**Note**: Ingredients and measures go from 1-20 (strIngredient1, strMeasure1, etc.). Empty ones are null or empty strings.

### Sample API Response (List by Category)
```json
{
  "meals": [
    {
      "strMeal": "Baked salmon with fennel & tomatoes",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/1548772327.jpg",
      "idMeal": "52959"
    }
  ]
}
```

**Note**: This simplified response requires a second API call to get full details using the recipe ID.

## Getting Started

1. Review the boilerplate code structure in this project
2. Choose your UI framework (UIKit or SwiftUI)
3. Plan your architecture approach
4. Start with models and networking layer
5. Build the UI and connect to services
6. Test with different search terms
7. Handle edge cases and errors

## Interview Tips
- **Ask clarifying questions** - Should I implement both list and detail? Which API endpoints to use?
- **Think out loud** - Explain your architectural decisions before coding
- **Start simple** - Get basic search + display working first, then enhance
- **Show your process** - Comment on trade-offs (e.g., "I'm using a simple array for now, but would use pagination in production")
- **Handle the full flow** - Don't forget empty states, loading states, and error states
- **Discuss image loading** - Mention you're aware of performance concerns even if you use basic URLSession

## Suggested Implementation Order

1. **Models** (5-10 min)
   - Create `Recipe` model matching API response
   - Use Codable for JSON parsing
   - Consider separate models for list vs detail if needed

2. **Service Layer** (10-15 min)
   - Create `RecipeService` with search method
   - Set up URLSession networking
   - Handle Result type for errors
   - Test with actual API endpoint

3. **Recipe List View** (15-20 min)
   - Create list UI (UITableView or SwiftUI List)
   - Add search bar
   - Connect to service
   - Display results with images
   - Add loading indicator

4. **Recipe Detail View** (10-15 min)
   - Create detail screen
   - Navigate from list
   - Display full recipe information
   - Parse ingredients/measures properly

5. **Polish** (5-10 min)
   - Error handling
   - Empty state
   - Code cleanup
   - Test edge cases

## Common Pitfalls to Avoid
- Not handling null/empty ingredients in the API response
- Blocking main thread with image loading
- Force unwrapping optionals
- Not showing loading states
- Ignoring error cases
- Over-engineering the solution

Good luck!
