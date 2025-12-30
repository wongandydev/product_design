# API Setup Guide

## Why Use Real APIs?
Using a real API provides authentic networking experience and tests your URLSession implementation with actual async/await patterns. However, mock data is available as a fallback if you prefer to skip this step.

## Quick Start (Skip API Setup)
If you want to start coding immediately, use the provided mock data in `MockData.swift`. You can implement your service layer with mock data and optionally upgrade to the real API later.

## API Provider: TMDB (The Movie Database)

### Overview
- **Website:** https://www.themoviedb.org/
- **Free Tier:** 1000 requests per day
- **Signup Required:** Yes (free, no credit card needed)
- **Documentation:** https://developer.themoviedb.org/docs
- **API Type:** REST API with JSON responses

### Step 1: Create an Account
1. Visit https://www.themoviedb.org/signup
2. Fill out the registration form (email, username, password)
3. Check your email and verify your account
4. Log in to your new account

### Step 2: Get Your API Key
1. Once logged in, go to your account settings (click your avatar, top right)
2. Click on "Settings" in the dropdown
3. In the left sidebar, click "API"
4. Click "Request an API Key" (or "Create" if you see that button)
5. Select "Developer" (not "Commercial")
6. Accept the terms of use
7. Fill out the application form:
   - **Application Name:** "iOS Interview Practice" (or anything you want)
   - **Application URL:** "http://localhost" (or just "N/A")
   - **Application Summary:** "Learning iOS development and API integration"
8. Submit the form
9. Copy your **API Key (v3 auth)** - this is what you'll use

**Note:** You'll see two keys - use the "API Key (v3 auth)", NOT the "API Read Access Token (v4 auth)"

### Step 3: Test Your API Key
Open Terminal and try this command (replace `YOUR_API_KEY` with your actual key):

```bash
curl "https://api.themoviedb.org/3/movie/popular?api_key=YOUR_API_KEY"
```

You should see a JSON response with popular movies. If you see an error like "Invalid API key", double-check you copied it correctly.

### Step 4: Add API Key to Your Code
In `MovieService.swift`, update the `fetchPopularMovies()` method:

```swift
func fetchPopularMovies() async throws -> MoviesResponse {
    let apiKey = "YOUR_API_KEY_HERE"  // Paste your key here
    let urlString = "\(baseURL)/movie/popular?api_key=\(apiKey)"

    guard let url = URL(string: urlString) else {
        throw MovieServiceError.invalidURL
    }

    let (data, response) = try await URLSession.shared.data(from: url)

    guard let httpResponse = response as? HTTPURLResponse,
          httpResponse.statusCode == 200 else {
        throw MovieServiceError.invalidResponse
    }

    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase

    do {
        return try decoder.decode(MoviesResponse.self, from: data)
    } catch {
        throw MovieServiceError.decodingError
    }
}
```

**⚠️ Security Note:** For this practice project, it's okay to hardcode the API key. In a real app, you'd use environment variables or a config file that's `.gitignored`. Never commit API keys to public repositories.

## Testing Your Implementation

1. Run the app (⌘+R)
2. You should see real movie data load from TMDB
3. Posters should display (they're hosted on TMDB's CDN)
4. Pull to refresh should fetch fresh data

## Troubleshooting

### "Invalid API Key" Error
- Double-check you copied the entire key with no extra spaces
- Make sure you're using the v3 API key, not the v4 token
- Verify the key is active in your TMDB account settings

### "Resource Not Found" (404) Error
- Check the baseURL is `https://api.themoviedb.org/3`
- Verify the endpoint is `/movie/popular`
- Ensure the API key parameter is included: `?api_key=YOUR_KEY`

### Rate Limit Exceeded
- Free tier allows 1000 requests per day
- If you hit the limit, either wait 24 hours or use mock data
- You can check your usage in your TMDB account settings

### JSON Decoding Errors
Print the raw response to debug:
```swift
if let jsonString = String(data: data, encoding: .utf8) {
    print("Raw JSON:", jsonString)
}
```

Common issues:
- Forgot to set `decoder.keyDecodingStrategy = .convertFromSnakeCase`
- Model properties don't match the JSON response
- Check CodingKeys enum matches the API field names

### App Compiles But No Data Shows
- Check the ViewModel is calling `loadMovies()` in `onAppear`
- Verify the ViewModel's `movies` array is being updated
- Look for errors in the Xcode console
- Add print statements to debug:
  ```swift
  print("Fetched \(movies.count) movies")
  ```

## API Endpoints Reference

### Popular Movies
```
GET https://api.themoviedb.org/3/movie/popular?api_key=YOUR_KEY
```

### Search Movies (Optional Enhancement)
```
GET https://api.themoviedb.org/3/search/movie?api_key=YOUR_KEY&query=SEARCH_TERM
```

### Movie Details (Optional Enhancement)
```
GET https://api.themoviedb.org/3/movie/{movie_id}?api_key=YOUR_KEY
```

## Image URLs

TMDB returns relative poster paths like `/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg`

To display images, construct the full URL:
```
https://image.tmdb.org/t/p/w500/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg
```

The `Movie` model already has a `posterURL` computed property that handles this.

Available image sizes:
- `w92` - Thumbnail
- `w154` - Small
- `w185` - Medium
- `w342` - Large
- `w500` - Extra Large (recommended)
- `w780` - XXL
- `original` - Original size

## Fallback: Using Mock Data

If API setup isn't working or you want to focus on the UI first, use mock data:

```swift
func fetchPopularMovies() async throws -> MoviesResponse {
    // Simulate network delay
    try await Task.sleep(nanoseconds: 500_000_000) // 0.5 seconds

    // Decode mock data
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return try decoder.decode(MoviesResponse.self, from: MockData.moviesJSON)
}
```

This lets you:
- Test loading states
- Implement the UI
- Test error handling (throw errors intentionally)
- Complete the challenge without external dependencies

## Next Steps

Once you have the API working:
1. Implement error handling (network failures, invalid responses)
2. Add loading states (show progress indicator while fetching)
3. Test with airplane mode (verify error states work)
4. Consider adding pull-to-refresh
5. Optional: Add search functionality using the search endpoint

Good luck!
