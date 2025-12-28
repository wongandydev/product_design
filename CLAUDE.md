# Claude Agent Instructions for iOS Interview Practice Projects

## 🎯 Quick Summary

When user says: **"Create me an iOS interview project"**

**You MUST ask first:**
- "Are you looking for a **45-minute interview** or a **take-home project**?"

Then you create:
1. **Working Xcode project** with boilerplate code and mock data
2. **INSTRUCTIONS.md** - Interview prompt (mimics real interview email)
3. **CLAUDE.md** (in project folder) - Reviewer AI instructions

**Reference:** Use `01_weather_app_attempt1/` as your template for code patterns and structure

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

**Search the internet** for popular interview challenges and real APIs with mock data.

**Popular challenge types:**
- Movie/TV browser (TMDB API)
- Photo gallery (Unsplash, Pexels)
- Weather app (OpenWeatherMap)
- News feed (NewsAPI)
- GitHub repo search (GitHub API)
- Recipe finder (TheMealDB, Spoonacular)
- Book search (Google Books)
- Crypto tracker (CoinGecko)

**Look up:**
- Real API endpoints
- Sample JSON responses
- Authentication requirements (prefer APIs with free tier or no auth)
- Mock data examples

---

## Step 3: Create Project Structure

### Folder Structure:
```
[NN]_[feature]_app_attempt1/
├── INSTRUCTIONS.md           # Interview prompt for the user
├── CLAUDE.md                 # AI reviewer instructions
└── [AppName]/                # Working Xcode project
    ├── [AppName].xcodeproj/
    └── [AppName]/
        ├── [AppName]App.swift
        ├── Info.plist
        ├── Assets.xcassets/
        ├── Models/
        │   └── [Feature]Model.swift
        ├── Services/
        │   └── [Feature]Service.swift
        ├── ViewModels/
        │   └── [Feature]ViewModel.swift
        ├── Views/
        │   └── [Feature]View.swift
        └── Helpers/
            └── MockData.swift
```

### What to include:
- ✅ Working Xcode project (opens and runs immediately)
- ✅ Boilerplate UI code (TextField, Button, List, NavigationStack)
- ✅ Mock data for testing
- ✅ Method signatures and property declarations
- ⚠️ Incomplete implementation (user fills in logic)

---

## Step 4: Write INSTRUCTIONS.md

**Style:** Mimic a real interview prompt email

**Include:**
1. **Context** - Brief intro (company name optional, or use "Company XYZ")
2. **Task** - What feature to build
3. **Requirements** - Must-have features (3-5 bullet points)
4. **Technical constraints** - SwiftUI, MVVM, async/await, etc.
5. **Time limit** - 45 minutes or "take-home, submit within 48 hours"
6. **API information** - Endpoint, sample JSON, how to use mock data
7. **Evaluation criteria** - What they're looking for
8. **Submission** - "Zip the project when done"

**Example structure:**
```markdown
# iOS Engineer Interview Challenge

## Overview
Welcome! We'd like you to build a simple [FEATURE] app to demonstrate your iOS development skills.

## Task
Build a SwiftUI app that allows users to [CORE FUNCTIONALITY].

## Requirements
- [ ] Fetch data from the provided API endpoint
- [ ] Display results in a scrollable list
- [ ] Handle loading and error states
- [ ] Use MVVM architecture pattern
- [ ] Use modern Swift (async/await, Codable)

## Time Limit
You have **45 minutes** to complete this challenge.

## API Information
**Endpoint:** `https://api.example.com/movies`

**Sample Response:**
```json
{
  "results": [
    {"id": 1, "title": "Example Movie", ...}
  ]
}
```

**Mock Data:** We've included `MockData.swift` for offline testing.

## What We're Looking For
- Clean, readable code
- Proper error handling
- SwiftUI best practices
- Appropriate architecture

## Submission
When finished, compress the entire project folder and submit.

## Getting Started
1. Open `[AppName].xcodeproj` in Xcode
2. Run the app (⌘+R) to see the boilerplate UI
3. Implement the required functionality
4. Test with mock data first, then try the real API

Good luck!
```

---

## Step 5: Write CLAUDE.md (In Project Folder)

**Purpose:** Guide the AI reviewer to act as both an interviewer and a coach.

**Include:**
1. **Role** - "You are an iOS engineering interviewer"
2. **Task** - "Review this completed interview project"
3. **Evaluation criteria** - What to look for
4. **Feedback format** - Interviewer + coach perspective
5. **Reference** - Point to INSTRUCTIONS.md for requirements

**Template:**
```markdown
# AI Reviewer Instructions - iOS Interview Project

## Your Role
You are an experienced iOS engineering interviewer reviewing a candidate's submission for a **[45-minute interview / take-home project]** challenge.

## Interview Task
Read `INSTRUCTIONS.md` to understand what the candidate was asked to build.

## Your Job
1. **Review the code** - Check if requirements were met
2. **Evaluate quality** - Assess code organization, architecture, best practices
3. **Act as interviewer** - Would you move this candidate to the next round?
4. **Act as coach** - Provide constructive feedback on what could be improved

## Evaluation Criteria

### Must-Have (Pass/Fail)
- [ ] App builds and runs without errors
- [ ] Core functionality works as specified
- [ ] Handles loading states
- [ ] Handles error states
- [ ] Uses SwiftUI and MVVM architecture

### Code Quality (Scoring 1-5)
- **Architecture** - Proper separation of concerns (Model, View, ViewModel, Service)
- **Swift Best Practices** - Modern syntax (async/await, Codable, @Published/@Observable)
- **Error Handling** - Proper use of try/catch, user-friendly error messages
- **Code Clarity** - Readable, well-structured, appropriate naming
- **UI/UX** - Clean interface, handles edge cases (empty states, loading indicators)

### Bonus Points
- Went beyond requirements
- Added tests
- Exceptional code quality or creative solutions

## Feedback Format

Provide feedback in this structure:

### 1. Interview Decision
**Decision:** [PASS / WEAK PASS / FAIL]
**Reasoning:** [1-2 sentences]

### 2. What Went Well
- [Highlight 2-3 strong points]

### 3. Areas for Improvement
- [Point out 2-3 specific issues or missed opportunities]

### 4. Code Review Comments
[Provide specific file/line feedback on key issues]

Example:
- `MovieService.swift:25` - Missing error handling for network failures
- `MovieListViewModel.swift:40` - Should use @MainActor for UI updates

### 5. Overall Assessment
[2-3 paragraphs with holistic view, interview performance, next steps]

### 6. Coaching Advice
[If this were a learning exercise, what should they study or practice?]

## Tone
- Be constructive and encouraging
- Point out both strengths and weaknesses
- Be specific (cite files/lines when possible)
- Balance interviewer objectivity with coach supportiveness
```

---

## Step 6: Create Xcode Project with Boilerplate Code

### Use `01_weather_app_attempt1/` as reference

**Copy and adapt:**
1. `.xcodeproj/project.pbxproj` (update UUIDs, bundle IDs, names)
2. App structure (Models, Services, ViewModels, Views, Helpers)
3. SwiftUI entry point (`[AppName]App.swift`)
4. Basic UI layout

### What to include in code:

**✅ Fully working:**
- SwiftUI entry point
- Basic UI layout (TextField, Button, List, etc.)
- Info.plist, Assets.xcassets
- Mock data (sample JSON as Data)

**⚠️ Incomplete (user implements):**
- Model properties and Codable conformance
- Service method bodies (networking logic)
- ViewModel methods (state management, API calls)
- Error handling

**Example - Service layer:**
```swift
class MovieService {
    static let shared = MovieService()

    private let baseURL = "https://api.themoviedb.org/3"

    func fetchPopularMovies() async throws -> MoviesResponse {
        // Implement networking here
        // 1. Construct URL
        // 2. Create URLRequest
        // 3. Use URLSession.shared.data(for:)
        // 4. Decode JSON response
        fatalError("Not implemented")
    }
}
```

**Do NOT write explicit TODO comments like "// TODO: implement this"**
- Just leave method bodies incomplete
- Use `fatalError("Not implemented")` or empty return
- Let the user figure out what needs to be done based on INSTRUCTIONS.md

---

## Step 7: Search Internet for API Info

**Before creating project:**
1. Search for "[FEATURE] free API" (e.g., "movie database free API")
2. Find real endpoint URLs
3. Get sample JSON responses
4. Check if auth is required (prefer free-tier or no-auth APIs)
5. Include this info in INSTRUCTIONS.md

**Example APIs:**
- TMDB (movies) - Requires free API key
- Unsplash (photos) - Requires free API key
- JSONPlaceholder (mock data) - No auth required
- TheMealDB (recipes) - Free, no auth
- CoinGecko (crypto) - Free, no auth

---

## Step 8: Verify Before Submitting

**Checklist:**
- [ ] Created folder `[NN]_[feature]_app_attempt1/`
- [ ] `INSTRUCTIONS.md` exists and mimics real interview prompt
- [ ] `CLAUDE.md` exists with reviewer instructions
- [ ] `.xcodeproj` opens in Xcode without errors
- [ ] App builds and runs (⌘+R)
- [ ] UI displays correctly
- [ ] Mock data is provided
- [ ] Code is incomplete (user must implement core logic)
- [ ] No explicit "TODO" comments (just incomplete code)

---

## Example Workflow

**User:** "Create me an iOS interview project"

**Agent:**
1. **Ask:** "Are you looking for a **45-minute interview** or a **take-home project**?"
2. **User responds:** "45-minute interview"
3. **Agent:**
   - Searches internet for simple API (e.g., "free movies API")
   - Finds TMDB API with sample JSON
   - Creates `04_movie_browser_app_attempt1/`
   - Writes `INSTRUCTIONS.md` (interview prompt for movie list app)
   - Writes `CLAUDE.md` (reviewer instructions)
   - Creates working Xcode project with boilerplate UI
   - Leaves Service and ViewModel incomplete
   - Includes mock JSON data
4. **Agent tells user:** "Done! Open `04_movie_browser_app_attempt1/MovieBrowserApp.xcodeproj` and read `INSTRUCTIONS.md` to start."

---

## Important Principles

1. **Always ask 45-min vs take-home first**
2. **Search internet for real APIs and mock data**
3. **INSTRUCTIONS.md mimics real interview prompts**
4. **CLAUDE.md guides AI reviewer to act as interviewer + coach**
5. **Include incomplete code, not explicit TODO comments**
6. **Zero setup - project runs immediately**
7. **SwiftUI only, modern Swift patterns**
8. **User compresses project when done → AI reviews it**

---

## Summary

**Goal:** Create realistic iOS interview practice where:
- User gets authentic interview experience
- AI reviewer provides professional feedback
- Everything is self-contained and ready to run
- Mirrors real-world interview process
