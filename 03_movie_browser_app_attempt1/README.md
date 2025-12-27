# iOS Interview Challenge: Movie Browser App

## Overview
Build a movie browsing application that fetches and displays popular movies from The Movie Database (TMDB) API with search functionality.

## Time Allocation
- **In-person interview**: 45-60 minutes
- **Take-home**: 2-3 hours

## Requirements

### Core Features (Must Have)
1. **Movie List Display**
   - Display a scrollable list of popular movies
   - Show movie poster image
   - Show movie title
   - Show release year
   - Show rating/vote average

2. **Movie Detail View**
   - Navigate to detail view when tapping a movie
   - Show larger poster image
   - Show full title and overview/description
   - Show release date
   - Show rating and vote count
   - Show genres (if available)

3. **Search Functionality**
   - User can search for movies by title
   - Display search results in the same list format
   - Clear search to return to popular movies

4. **API Integration**
   - Use The Movie Database (TMDB) API
   - Handle network requests properly
   - Parse JSON responses
   - Load poster images from URLs

### Technical Requirements
- Use SwiftUI (required for this challenge)
- Follow MVVM architecture pattern
- Handle loading states
- Handle error states (no internet, API errors, etc.)
- Clean, readable code with proper naming conventions
- Async/await for network calls

### Bonus Features (Nice to Have)
- Pull to refresh
- Infinite scrolling/pagination
- Favorite/bookmark movies
- Persist favorites locally
- Unit tests
- Custom animations
- Shimmer loading effect
- Genre filtering

## What We're Evaluating
1. **Code Organization** - MVVM architecture, clear separation of concerns
2. **Error Handling** - Network failures, empty states, user feedback
3. **UI/UX** - Clean interface, loading states, smooth navigation
4. **Communication** - Ability to explain decisions and trade-offs
5. **iOS Fundamentals** - Proper use of SwiftUI, async/await, image loading

## API Information

### The Movie Database (TMDB) API

**Base URL**: `https://api.themoviedb.org/3`

**Important**: For this challenge, you can use the mock data provided in `MockData.swift` or sign up for a free API key at https://www.themoviedb.org/settings/api

#### Popular Movies Endpoint
- **Endpoint**: `/movie/popular`
- **Method**: GET
- **Parameters**:
  - `api_key`: Your API key (use "demo" for mock mode)
  - `page`: Page number (default: 1)

**Example URL**:
```
https://api.themoviedb.org/3/movie/popular?api_key=YOUR_API_KEY&page=1
```

#### Search Movies Endpoint
- **Endpoint**: `/search/movie`
- **Method**: GET
- **Parameters**:
  - `api_key`: Your API key
  - `query`: Search term
  - `page`: Page number (default: 1)

**Example URL**:
```
https://api.themoviedb.org/3/search/movie?api_key=YOUR_API_KEY&query=inception&page=1
```

#### Image URLs
- **Base URL**: `https://image.tmdb.org/t/p/`
- **Sizes**: `w92`, `w154`, `w185`, `w342`, `w500`, `w780`, `original`
- **Format**: `{base_url}{size}{poster_path}`

**Example**:
```
https://image.tmdb.org/t/p/w500/poster_path_from_api.jpg
```

### Sample API Response

#### Popular Movies Response
```json
{
  "page": 1,
  "results": [
    {
      "id": 550,
      "title": "Fight Club",
      "overview": "A ticking-time-bomb insomniac and a slippery soap salesman...",
      "poster_path": "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
      "backdrop_path": "/fCayJrkfRaCRCTh8GqN30f8oyQF.jpg",
      "release_date": "1999-10-15",
      "vote_average": 8.4,
      "vote_count": 26280,
      "genre_ids": [18, 53, 35]
    }
  ],
  "total_pages": 500,
  "total_results": 10000
}
```

## Getting Started

1. Open `MovieBrowserApp.xcodeproj` in Xcode
2. Press ⌘+R to build and run the app
3. You'll see a working UI with mock data
4. Implement the TODO sections in the code
5. Test your implementation

## Interview Tips
- **Think out loud** - Explain your approach before coding
- **Ask clarifying questions** - Don't make assumptions about requirements
- **Start simple** - Get basic functionality working first (list view with mock data)
- **Refactor as you go** - Show you can improve code iteratively
- **Discuss trade-offs** - Explain why you chose certain approaches
- **Handle edge cases** - Empty states, errors, slow network

## Suggested Implementation Order

1. **Models** (10 min)
   - Implement `Movie` and `MoviesResponse` structs
   - Make them conform to `Codable`
   - Add any computed properties needed

2. **Service Layer** (15 min)
   - Implement `fetchPopularMovies()` method
   - Implement `searchMovies()` method
   - Handle errors appropriately
   - Use async/await pattern

3. **ViewModel** (10 min)
   - Implement `loadPopularMovies()` method
   - Implement `searchMovies()` method
   - Manage loading and error states
   - Handle search text input

4. **UI Polish** (10 min)
   - Verify navigation works
   - Add loading indicators
   - Add error messages
   - Test all user flows

Good luck! 🎬
