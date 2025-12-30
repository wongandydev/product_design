# Claude Agent Instructions for iOS Interview Practice Projects

## ⚠️ IMPORTANT: Self-Improvement Instructions

**If the user has to correct you or clarify something that was confusing in this CLAUDE.md file:**
1. **Update this file immediately** with the clarification
2. Add the lesson learned to the appropriate section
3. Be specific about what was confusing and what the correct approach is
4. This ensures future Claude agents won't make the same mistake

**Goal:** This file should continuously improve based on real user feedback.

---

## 🎯 Quick Summary

When user says: **"Create me an iOS interview project"**

**You MUST ask first:**
- "Are you looking for a **45-minute interview** or a **take-home project**?"

Then you create:
1. **Working Xcode project** with boilerplate code and mock data
2. **INSTRUCTIONS.md** - Main requirements, API documentation, and what to implement
3. **API_SETUP.md** - Instructions for getting API keys and setting up real API access
4. **SOLUTION_CHECKLIST.md** - Pre-submission verification checklist

**Reference:** Use `04_movie_browser_app_attempt1/` for structure patterns

---

## Purpose

This file guides Claude agents to generate **realistic iOS interview practice projects**. The user will:
1. Get a working Xcode project with an interview prompt
2. Implement the feature in the allotted time
3. Compress/zip the completed project
4. Have another AI agent review it using the project's CLAUDE.md

This mimics a real interview experience with AI-powered feedback.

---

## User Command Examples

- "Create me an iOS interview project"
- "Generate a new interview challenge"
- "Make me a take-home iOS project"

---

## Step 1: Ask About Interview Type

**CRITICAL:** Always ask first!

**Question to user:**
> "Are you looking for a **45-minute interview** or a **take-home project**?"

**Adjust scope based on answer:**
- **45-minute interview:**
  - Simple API integration
  - List view only (no detail view)
  - 1-2 core features
  - Example: "Fetch and display list of movies"

- **Take-home project:**
  - Full CRUD or complex feature
  - List + detail views
  - Search/filter functionality
  - Error handling, edge cases
  - 3-5 hours of work
  - Example: "Build movie browser with search, detail view, and favorites"

---

## Step 2: Choose Challenge Topic

**DO NOT search the internet.** Just pick a topic and create mock JSON data.

**Popular challenge types:**
- Movie/TV browser (TMDB API)
- Photo gallery (Unsplash, Pexels)
- Weather app (OpenWeatherMap)
- News feed (NewsAPI)
- GitHub repo search (GitHub API)
- Recipe finder (TheMealDB, Spoonacular)
- Book search (Google Books API)
- Crypto tracker (CoinGecko)
- Restaurant search
- User profiles
- Shopping cart
- To-do list with sync

**What you need to provide:**
- Realistic API endpoint URL (can be fake, just for documentation)
- Sample JSON response (create your own mock data that looks realistic)
- Include this in README.md and MockData.swift

---

## Step 3: Create Project Structure

### Folder Structure:
```
[NN]_[feature]_app_attempt1/
├── INSTRUCTIONS.md               # Main requirements and API documentation
├── SOLUTION_CHECKLIST.md         # Pre-submission verification checklist
│
└── [AppName]/                    # Working Xcode project
    ├── [AppName].xcodeproj/
    │   ├── project.pbxproj
    │   └── project.xcworkspace/
    │       ├── contents.xcworkspacedata
    │       └── xcshareddata/
    │           └── IDEWorkspaceChecks.plist
    └── [AppName]/
        ├── [AppName]App.swift
        ├── Assets.xcassets/
        │   ├── Contents.json
        │   ├── AppIcon.appiconset/
        │   └── AccentColor.colorset/
        ├── Models/
        │   └── [Feature].swift
        ├── Services/
        │   └── [Feature]Service.swift
        ├── ViewModels/
        │   └── [Feature]ViewModel.swift
        ├── Views/
        │   ├── [Feature]ListView.swift
        │   └── [Feature]RowView.swift
        └── Helpers/
            └── MockData.swift
```

### What to include:
- ✅ Working Xcode project (opens and runs immediately)
- ✅ Mock data for testing
- ✅ Complete Models with Codable conformance
- ⚠️ INCOMPLETE Views (user writes SwiftUI code)
- ⚠️ INCOMPLETE Service (user implements networking)
- ⚠️ INCOMPLETE ViewModel (user implements state management)

---

## Step 4: Write Documentation Files

**Create 3 markdown files in the project root:**

### INSTRUCTIONS.md
**Purpose:** Main requirements, API documentation, and implementation guide
**Style:** Technical specification with clear requirements and implementation hints

**Include:**
1. **Overview** - Brief intro to the challenge
2. **Task** - What feature to build
3. **Time Limit** - 45 minutes or take-home
4. **Requirements** - Must-have features (3-5 bullet points with checkboxes)
5. **Technical Constraints** - SwiftUI, MVVM, async/await, no third-party libraries
6. **API Information** - Endpoint, sample JSON, response fields explanation
7. **Project Structure** - What files exist and which ones to implement
8. **What You Need to Implement** - Specific guidance on Service and ViewModel
9. **Implementation Tips** - Code patterns and suggested approach
10. **What We're Looking For** - Evaluation criteria
11. **Getting Started** - How to open and run the project
12. **Submission** - How to submit when done

**Example structure:**
```markdown
# iOS Engineer Interview Challenge - [Feature Name]

## Overview
Welcome! Build a simple [FEATURE] app to demonstrate your iOS development skills.

## Task
Build a SwiftUI app that [CORE FUNCTIONALITY].

## Time Limit
**45 minutes**

## Requirements
- [ ] Fetch data from the provided API endpoint
- [ ] Display results in a scrollable list
- [ ] Handle loading and error states
- [ ] Use MVVM architecture pattern

## Technical Constraints
- Use SwiftUI for the UI
- Use MVVM architecture
- Use modern Swift features (async/await, Codable)
- No third-party libraries

## API Information
[Include endpoint, sample JSON, field descriptions]

## Project Structure
[Show folder structure with indicators of what's complete vs incomplete]

## What You Need to Implement
### 1. MovieService.swift
- Implement fetchMovies() method
- Use async/await with URLSession
- Decode JSON response

### 2. MovieListViewModel.swift
- Implement loadMovies() method
- Update @Published properties
- Handle loading and error states

## Implementation Tips
[Include code snippets for common patterns]

## What We're Looking For
- Clean, readable code
- Proper MVVM implementation
- Error handling
- Modern Swift patterns

## Getting Started
1. Open [AppName].xcodeproj in Xcode
2. Run the app (⌘+R)
3. Implement the required functionality
4. Test your implementation

## Submission
When finished, compress the entire project folder.

Good luck!
```

### API_SETUP.md
**Purpose:** Instructions for obtaining API keys and setting up real API access
**Style:** Step-by-step tutorial specific to the API chosen for this project

**Include:**
1. **Why Use Real APIs** - Benefits of real API integration vs mock data
2. **Quick Start with Mock Data** - For users who want to skip API setup
3. **API Provider Information** - Name, website, free tier details
4. **Step-by-Step Setup** - Creating account, getting API key, finding documentation
5. **API Key Security** - Never commit keys to git, use environment variables or config
6. **Testing the API** - How to verify the API key works (curl example)
7. **Integration Guide** - Where to add the API key in the code
8. **Troubleshooting** - Common errors and solutions
9. **Alternative: Mock Data** - Remind them mock data is available as fallback

**Example template:**
```markdown
# API Setup Guide

## Why Use Real APIs?
Using a real API provides authentic networking experience and tests your URLSession implementation. However, mock data is available as a fallback if you prefer to skip this step.

## Quick Start (Skip API Setup)
If you want to start coding immediately, use the provided mock data in `MockData.swift`. You can implement your service layer with mock data and optionally upgrade to the real API later.

## API Provider: [API Name]

### Overview
- **Website:** [API website URL]
- **Free Tier:** [Request limits, e.g., "1000 requests/day"]
- **Signup Required:** [Yes/No and if credit card needed]
- **Documentation:** [Link to API docs]

### Step 1: Create an Account
1. Visit [signup URL]
2. [Specific signup instructions]
3. Verify your email if required

### Step 2: Get Your API Key
1. [Where to navigate after login]
2. [Steps to generate/find API key]
3. Copy your API key

### Step 3: Test Your API Key
Try this command in Terminal to verify it works:
```bash
curl "[example API endpoint with YOUR_API_KEY placeholder]"
```

You should see a JSON response with [expected data].

### Step 4: Add API Key to Your Code
In `[ServiceFileName].swift`, add your API key:

```swift
// Option 1: Simple approach (for practice projects only)
let apiKey = "YOUR_API_KEY_HERE"

// Option 2: Better approach (for real projects)
// Add to a Config.swift file that's .gitignored
```

**⚠️ Security Warning:** Never commit API keys to version control. For this practice project it's okay to hardcode temporarily, but in production always use environment variables or secure configuration.

### Step 5: Update Service Implementation
Replace the mock data approach with real networking:

```swift
func fetch[Data]() async throws -> [ResponseType] {
    let urlString = "\(baseURL)/[endpoint]?api_key=\(apiKey)"
    guard let url = URL(string: urlString) else {
        throw [ServiceError].invalidURL
    }

    let (data, _) = try await URLSession.shared.data(from: url)
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return try decoder.decode([ResponseType].self, from: data)
}
```

## Troubleshooting

### "Invalid API Key" Error
- Double-check you copied the complete key
- Verify there are no extra spaces
- Some APIs have multiple key types - make sure you're using the right one

### "Resource Not Found" (404) Error
- Verify the endpoint URL is correct
- Check the API documentation for the current endpoint format
- Ensure required parameters are included

### Rate Limit Exceeded
- You've hit the free tier limit
- Wait for the limit to reset or use mock data as fallback
- Consider caching responses to reduce API calls

### JSON Decoding Errors
- Print the raw response: `print(String(data: data, encoding: .utf8))`
- Compare with your model's CodingKeys
- Verify snake_case to camelCase conversion is set

## Fallback: Using Mock Data
If API setup isn't working, you can still complete the challenge:

```swift
func fetch[Data]() async throws -> [ResponseType] {
    // Use mock data instead
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return try decoder.decode([ResponseType].self, from: MockData.[dataName])
}
```

This lets you focus on architecture and SwiftUI implementation without API complications.
```

### SOLUTION_CHECKLIST.md
**Purpose:** Pre-submission verification checklist for both user and AI reviewer
**Style:** Comprehensive checklist format

**Include:**
1. **Core Functionality** - Feature requirements checklist
2. **State Management** - Loading, error, empty states
3. **Architecture** - MVVM implementation checklist
4. **Swift Best Practices** - Modern patterns, optionals handling
5. **Edge Cases** - Error handling, network failures
6. **UI/UX** - User experience considerations
7. **Build & Run** - Project compiles and runs
8. **Interview Readiness** - Questions to verify understanding

**Example:**
```markdown
# Solution Checklist

## Core Functionality
- [ ] App fetches data from API/mock data
- [ ] Results display in scrollable list
- [ ] Each item shows required information
- [ ] App builds and runs without errors

## State Management
- [ ] Loading state displays while fetching
- [ ] Error state shows when request fails
- [ ] Empty state handles no results

## Architecture
- [ ] MVVM pattern implemented correctly
- [ ] Service layer handles networking
- [ ] ViewModel manages state
- [ ] Views observe ViewModel changes

## Swift Best Practices
- [ ] Uses async/await for networking
- [ ] Proper Codable implementation
- [ ] @Published properties for state
- [ ] @MainActor for UI updates
- [ ] No force unwrapping

## Edge Cases
- [ ] Network error handling
- [ ] Invalid data handling
- [ ] User feedback for errors

## Build & Run
- [ ] Project builds without errors
- [ ] App runs on simulator
- [ ] No crashes during basic usage

## Interview Readiness Questions
- Can you explain your architecture decisions?
- How did you handle error states?
- What would you improve with more time?
```

---

## Step 5: Create Swift Files

### Models (COMPLETE - User doesn't implement)
- Create data models with Codable conformance
- Include proper CodingKeys for snake_case to camelCase mapping
- Make structs conform to Identifiable where needed
- Handle optional properties correctly
- See `03_github_repo_search_attempt1/GitHubRepoSearchApp/GitHubRepoSearchApp/Models/Repository.swift` for example

### Services (INCOMPLETE - User implements)
- Create Service class with singleton pattern
- Define error enum
- Create method signatures with proper async throws
- Leave method body with `fatalError("Not implemented")`
- Add comments explaining what needs to be implemented (but NO explicit TODO markers)
- See `03_github_repo_search_attempt1/GitHubRepoSearchApp/GitHubRepoSearchApp/Services/GitHubService.swift` for example

### ViewModels (INCOMPLETE - User implements)
- Create ViewModel class marked with @MainActor
- Conform to ObservableObject
- Add @Published properties for state (isLoading, errorMessage, results, searchText)
- Create method signatures for business logic
- Leave method bodies incomplete with comments
- See `03_github_repo_search_attempt1/GitHubRepoSearchApp/GitHubRepoSearchApp/ViewModels/RepositorySearchViewModel.swift` for example

### Views (INCOMPLETE - User implements)
- Create View files with minimal structure
- Include import SwiftUI and basic struct declarations
- Leave view bodies mostly empty or with simple placeholder
- User will implement the full SwiftUI layout
- DO NOT create complete UI - user should build this themselves

### Helpers (COMPLETE - User doesn't implement)
- Create MockData.swift with realistic JSON data
- Format as `Data` using `.data(using: .utf8)!`
- Include **10-15 sample items with variety** to make filtering/searching realistic
- Include diverse data (different categories, ratings, dates, etc.) so user must implement real filtering logic
- Match the structure defined in Models
- **Important:** Mock data should be rich enough that filtering is required, not just returning static results
- See `03_github_repo_search_attempt1/GitHubRepoSearchApp/GitHubRepoSearchApp/Helpers/MockData.swift` for example

---

## Step 6: Create Xcode Project with Boilerplate Code

### IMPORTANT: Create from scratch, DO NOT copy existing projects

**Create a brand new Xcode project by generating these files:**
1. `project.pbxproj` - Xcode project file (create manually with unique UUIDs)
2. `project.xcworkspace/` - Workspace configuration files
3. `Assets.xcassets/` - App icons and colors
4. SwiftUI entry point (`[AppName]App.swift`)
5. All source files in proper folders

### What to include in code:

**✅ Fully working:**
- SwiftUI entry point
- Basic UI layout (TextField, Button, List, etc.)
- Info.plist, Assets.xcassets
- Mock data (sample JSON as Data)

**⚠️ Incomplete (user implements):**
- Service method bodies (networking logic)
- ViewModel methods (state management, API calls)
- View bodies (SwiftUI layout and UI)
- Error handling

**Example - Service layer:**
```swift
class MovieService {
    static let shared = MovieService()

    private let baseURL = "https://api.themoviedb.org/3"

    func fetchPopularMovies() async throws -> MoviesResponse {
        // Implement networking here
        fatalError("Not implemented")
    }
}
```

**Example - ViewModel:**
```swift
@MainActor
class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadMovies() async {
        // Implement movie loading logic here
    }
}
```

**Example - View:**
```swift
struct MovieListView: View {
    @StateObject private var viewModel = MovieListViewModel()

    var body: some View {
        // Implement SwiftUI layout here
        Text("Movie List View")
    }
}
```

**Comment style for incomplete code:**
- Use simple, single-line comments: `// Implement networking here`
- NO multi-step numbered lists in comments
- NO explicit "TODO:" markers
- Let the INSTRUCTIONS.md guide the user on what to implement

---

## Step 7: Keep It Bare Bones

**Philosophy: Minimal but functional**

The projects should be **bare bones** - just enough to work, nothing extra.

**What this means:**
- Implement ONLY the core features listed in requirements
- Models should be complete and working (with Codable)
- MockData should be complete with realistic JSON
- Views, Service, and ViewModel should be INCOMPLETE (user implements)
- NO extra features, NO fancy animations, NO over-engineering
- Use simple comments, NOT multi-step numbered lists
- NO explicit "TODO:" markers

**Industry Best Practices (from research):**
- 90% of iOS interview projects test: API integration + JSON parsing + displaying data in a list
- For 45-min interviews: Focus on ONE core feature (search OR list, not both complex)
- For take-home: Can include multiple features (list + detail + search)
- Code should be production-ready quality, not "hackathon-level"
- Follow MVVM architecture strictly
- Use modern Swift: async/await, Codable, @Published, @MainActor

---

## Step 8: Verify Before Submitting

**Checklist:**
- [ ] Created folder `[NN]_[feature]_app_attempt1/`
- [ ] `INSTRUCTIONS.md` exists with requirements, API docs, and implementation guidance
- [ ] `SOLUTION_CHECKLIST.md` exists with verification checklist
- [ ] `.xcodeproj` opens in Xcode without errors
- [ ] App builds and runs (⌘+R)
- [ ] Models are complete with Codable conformance
- [ ] Mock data is provided in `Helpers/MockData.swift`
- [ ] Views are INCOMPLETE with minimal structure (user implements)
- [ ] Service is INCOMPLETE (user implements networking)
- [ ] ViewModel is INCOMPLETE (user implements state management)
- [ ] Use simple comments, NOT multi-step numbered lists
- [ ] NO explicit "TODO:" markers

---

## Example Workflow

**User:** "Create me an iOS interview project"

**Agent:**
1. **Ask:** "Are you looking for a **45-minute interview** or a **take-home project**?"
2. **User responds:** "45-minute interview"
3. **Agent:**
   - Chooses simple topic: GitHub repository search
   - Creates `03_github_repo_search_attempt1/`
   - Writes INSTRUCTIONS.md (requirements, API docs, implementation guidance)
   - Writes SOLUTION_CHECKLIST.md (verification checklist)
   - Creates brand new Xcode project from scratch (not copying)
   - Creates complete Models with Codable conformance
   - Creates complete MockData.swift with realistic JSON
   - Creates incomplete Views with minimal structure
   - Creates incomplete Service (with `fatalError("Not implemented")`)
   - Creates incomplete ViewModel (with simple comments)
   - All incomplete code uses simple comments, NO multi-step lists
4. **Agent tells user:** "Done! Open `03_github_repo_search_attempt1/GitHubRepoSearchApp.xcodeproj` in Xcode and read `INSTRUCTIONS.md` to start."

---

## Important Principles

1. **Always ask 45-min vs take-home first** - Scope differs significantly
2. **DO NOT search the internet** - Just create mock JSON data yourself
3. **Create projects from scratch** - Do NOT copy existing .xcodeproj files
4. **Keep it bare bones** - Minimal but functional, no over-engineering
5. **3 documentation files** - INSTRUCTIONS.md, API_SETUP.md, and SOLUTION_CHECKLIST.md
6. **Complete only Models and MockData** - Everything else is for user to implement
7. **Views are INCOMPLETE** - User writes the SwiftUI code themselves
8. **Leave business logic incomplete** - Service and ViewModel for user to implement
9. **Use simple comments** - NOT multi-step numbered lists, NO "TODO:" markers
10. **Use `fatalError("Not implemented")`** - For incomplete method bodies
11. **Zero setup - project builds immediately** - App should compile out of the box
12. **SwiftUI only, modern Swift patterns** - async/await, Codable, @Published, @MainActor
13. **Production-ready code quality** - Not hackathon-level, clean and professional

---

## Summary

**Goal:** Create realistic iOS interview practice where:
- User gets authentic interview experience
- AI reviewer provides professional feedback
- Everything is self-contained and ready to run
- Mirrors real-world interview process

---

## Lessons Learned (Updated from User Feedback)

### Session 2025-12-27: GitHub Repo Search Project

**What went wrong:**
- Agent attempted to search the internet for APIs (user interrupted)
- Agent attempted to copy RecipeApp.xcodeproj (user rejected)

**Corrections made:**
1. **DO NOT search the internet** - User clarified to skip web search and just create mock JSON data
2. **Create projects from scratch** - User wanted option #2 (brand new from scratch), not copying existing .xcodeproj
3. **File naming convention** - Projects use README.md, INTERVIEW_GUIDE.md, etc. (not INSTRUCTIONS.md or CLAUDE.md in project folder)
4. **Bare bones approach** - User emphasized keeping tests bare bones at times, minimal implementation

**Why this matters:**
- Searching the internet is slow and unnecessary - we can create realistic mock data ourselves
- Copying projects creates dependency on existing structure and can introduce inconsistencies
- Creating from scratch ensures clean, minimal, purpose-built projects
- Bare bones keeps the focus on core functionality that matters for interviews

### Session 2025-12-29: Documentation and View Completeness Changes (UPDATED)

**What was corrected:**
1. **Too many documentation files** - Agent was creating 5 markdown files (README, INTERVIEW_GUIDE, PROJECT_STRUCTURE, SETUP, SOLUTION_CHECKLIST)
2. **Views were complete** - Agent was building complete SwiftUI views for the user
3. **Multi-step TODO comments** - Agent was adding numbered step-by-step comments in incomplete code
4. **Later update:** User requested API_SETUP.md be added as a third file for API key instructions

**Corrections made:**
1. **3 documentation files** - Create INSTRUCTIONS.md (requirements + implementation guidance), API_SETUP.md (API key setup instructions), and SOLUTION_CHECKLIST.md
2. **Views are INCOMPLETE** - User should write the SwiftUI code themselves. Only provide minimal structure with placeholders
3. **Simple comments only** - Use single-line comments like `// Implement networking here`, NOT multi-step numbered lists, NO "TODO:" markers
4. **File naming** - Use INSTRUCTIONS.md (not INTERVIEW_GUIDE.md or README.md)

**What's complete vs incomplete now:**
- ✅ **COMPLETE:** Models (with Codable), MockData.swift (realistic JSON)
- ⚠️ **INCOMPLETE:** Views (minimal structure), Service (method signatures), ViewModel (property declarations)

**Why this matters:**
- In real interviews, candidates write ALL the code including UI - having complete views defeats the purpose
- API_SETUP.md helps users get real API keys for authentic networking experience
- Mock data still provided as fallback for quick testing
- Simple comments are cleaner and more realistic than step-by-step instructions
- The interviewee should figure out implementation from INSTRUCTIONS.md, not from code comments

### Session 2025-12-29: Mock Data vs Real APIs (UPDATED)

**What was corrected:**
- Initially preferred mock data only, but user clarified real APIs are better for realistic interview experience
- Mock data can be fallback, but real API integration is the goal

**Corrections made:**
1. **PREFER real APIs over mock data** - Interview projects should guide users to use real API calls when possible
2. **Provide API setup instructions** - Create API_SETUP.md with clear instructions on getting API keys
3. **Mock data as fallback** - Keep MockData.swift for quick testing or if API setup fails
4. **Choose APIs wisely** - Prefer free APIs with easy signup or no authentication required

**API Selection Guidelines:**
- **Best:** Free APIs with no authentication (e.g., some public government APIs, CoinGecko crypto API)
- **Good:** Free APIs with simple API key signup (TMDB movies, OpenWeather, NewsAPI free tier)
- **Avoid:** APIs requiring OAuth, credit cards, or complex authentication

**Mock data should be realistic and rich (as fallback):**
- **MUST include 12-15 items minimum** (not just 3-5)
- **For search apps:** Include diverse keywords/names across multiple categories
  - Example: GitHub repo search should have repos in Swift, JavaScript, Python, Go, Rust, Java, TypeScript, etc.
  - Searching "swift" should only return Swift repos, "react" only React repos, etc.
  - Forces implementation of real filtering logic (case-insensitive, match on name/description)
- **For rating/scoring apps:** Include varied ratings/scores so sorting and filtering matters
  - Example: Movies from 3.5 to 9.2 rating so filtering >7.0 is meaningful
- **For date/time apps:** Include different dates/times to test date parsing and sorting
- **For category apps:** Include multiple distinct categories to force real categorization logic
- **Goal:** User CANNOT just return all mock data - they MUST implement filtering/searching/sorting logic

**Implementation approach:**
- Primary: Real API integration with URLSession
- Fallback: Mock data for testing/development
- Both paths should use same models and decoding logic

**Why this matters:**
- Real APIs provide authentic networking experience
- Tests actual async/await implementation with URLSession
- More realistic to actual interview expectations
- Mock data still available as safety net for quick testing

---

## Industry Best Practices (Research Findings)

Based on research from iOS interview preparation resources and real company challenges:

### What 90% of iOS Interviews Test
- Hitting an API endpoint
- Parsing JSON response
- Creating data models
- Displaying data in a table view or list
- Basic error handling

This is the **core functionality** evaluated in most take-home challenges.

### Architecture Requirements
- **Common patterns:** MVVM, MVC, VIPER, Clean Architecture, or Redux
- **Best practice:** Ask what architecture the company uses and align with it
- **For SwiftUI:** Use SwiftUI-friendly architecture (MVVM with @Published/@StateObject)
- **Avoid:** Architecture-less code, even for small projects

### Code Quality Standards
Interview projects should demonstrate:
- Clean, readable code following Swift conventions
- DRY principles (Don't Repeat Yourself)
- Proper use of Extensions, Enums, Structs
- Consistent indentation and formatting
- Production-ready quality, not "hackathon-level" code
- Code that mimics a real pull request you'd submit at work

### README Requirements
A good README should include:
- **Architecture explanation** - Which pattern (MVVM, MVC, etc.) and why
- **Getting started** - Detailed setup instructions, dependencies, how to run
- **Usage information** - How to use the app, any credentials needed
- **Technical decisions** - Reasoning behind choices made
- **What's missing** - Acknowledge limitations and what you'd add with more time

### Testing Considerations
- **Ask first** - Check if unit tests are part of grading criteria
- **Make it testable** - Code should be easy to unit test (good separation of concerns)
- **Focus on coverage** - If tests are required, prioritize testing business logic

### Time Management
For 45-minute interviews:
- First 30 minutes: Complete the challenge
- Focus on getting basic functionality working
- Polish only if time permits
- Better to have working simple solution than incomplete advanced one

For take-home projects:
- Typically 2-5 hours of expected work
- Can include more features (list + detail views, search, filters)
- Expected to handle edge cases thoroughly
- Code should be very polished

### What Companies Look For
1. **Code organization** - Proper separation of concerns
2. **Swift best practices** - Modern syntax, proper optionals handling
3. **Error handling** - Network failures, edge cases, user feedback
4. **UI/UX** - Clean interface, loading states, empty states
5. **Architecture** - Consistent pattern implementation
6. **Communication** - Can explain decisions and trade-offs

### Common Pitfalls to Avoid
- Force unwrapping optionals (use optional binding)
- Blocking main thread with network calls
- No loading or error states
- Mixing concerns (networking in view controllers)
- Over-engineering for the scope
- Submitting code with obvious bugs

### Red Flags That Fail Interviews
- App doesn't build or run
- Crashes on basic usage
- No separation of concerns
- Hackathon-quality code
- Can't explain architectural decisions
- No error handling whatsoever

---

## Resources & References

**Research sources:**
- [Cracking the iOS-Developer Coding Challenge, SwiftUI Edition](https://racecondition.software/blog/swiftui-homeworks/)
- [What are the most common take-home tests for iOS developers?](https://www.hackingwithswift.com/interviews/sean-allen-what-are-the-most-common-take-home-tests-for-ios-developers)
- [The Ultimate Guide to Crushing Your iOS Developer Take-Home Challenge](https://medium.com/@lrnzbr/the-ultimate-guide-to-crushing-your-ios-developer-take-home-challenge-ddba76b3a8a2)
- [iOS Good Practices](https://github.com/futurice/ios-good-practices)
- [iOS Interview Challenges Collection](https://github.com/LiamGuedes/iOS-Interview-Challenges)

**Key takeaway:** Interview projects are not just about functionality - they demonstrate how you would work on a real team. Code quality, architecture, and communication matter as much as getting it working.
