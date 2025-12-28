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
2. **README.md** - Main requirements and API documentation
3. **INTERVIEW_GUIDE.md** - Interview approach guide
4. **PROJECT_STRUCTURE.md** - Detailed file descriptions
5. **SETUP.md** - Setup and running instructions
6. **SOLUTION_CHECKLIST.md** - Pre-submission verification

**Reference:** Use `01_weather_app_attempt1/` and `02_recipe_finder_app_attempt1/` for structure patterns

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
├── README.md                     # Main requirements and API documentation
├── INTERVIEW_GUIDE.md            # Interview approach guide
├── PROJECT_STRUCTURE.md          # Detailed file descriptions
├── SETUP.md                      # Setup and running instructions
├── SOLUTION_CHECKLIST.md         # Pre-submission verification
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
        │   ├── SearchView.swift (or main view)
        │   ├── [Feature]ListView.swift
        │   └── [Feature]RowView.swift
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

## Step 4: Write Documentation Files

**Create 5 markdown files in the project root:**

### README.md
**Purpose:** Main requirements and API documentation
**Style:** Technical specification with clear requirements

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

### INTERVIEW_GUIDE.md
**Purpose:** Interview approach guide - how to tackle the problem
**Reference:** See `03_github_repo_search_attempt1/INTERVIEW_GUIDE.md` for full example
**Key sections:** Overview, time allocation, requirements, technical requirements, what we're evaluating, API information, suggested implementation order, interview tips

### PROJECT_STRUCTURE.md
**Purpose:** Detailed file-by-file descriptions of what goes where
**Reference:** See `03_github_repo_search_attempt1/PROJECT_STRUCTURE.md` for full example
**Key sections:** File descriptions for Models, Services, ViewModels, Views, Helpers, implementation order, data flow, error handling strategy

### SETUP.md
**Purpose:** Setup and running instructions
**Reference:** See `03_github_repo_search_attempt1/SETUP.md` for full example
**Key sections:** Prerequisites, opening the project, running the app, troubleshooting, development workflow, keyboard shortcuts

### SOLUTION_CHECKLIST.md
**Purpose:** Pre-submission verification checklist
**Reference:** See `03_github_repo_search_attempt1/SOLUTION_CHECKLIST.md` for full example
**Key sections:** Core functionality checklist, state management checklist, architecture checklist, Swift best practices checklist, edge cases, UI/UX, testing, build & run, interview readiness questions

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

### Views (COMPLETE - User doesn't implement)
- Create fully working SwiftUI views
- Main view with search UI and state handling
- List view for displaying results
- Row view for individual items
- Include loading states, error states, empty states
- Use proper SwiftUI patterns (@StateObject, NavigationStack, etc.)
- See `03_github_repo_search_attempt1/GitHubRepoSearchApp/GitHubRepoSearchApp/Views/` for examples

### Helpers (COMPLETE - User doesn't implement)
- Create MockData.swift with realistic JSON data
- Format as `Data` using `.data(using: .utf8)!`
- Include 3-5 sample items
- Match the structure defined in Models
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

## Step 7: Keep It Bare Bones

**Philosophy: Minimal but functional**

The projects should be **bare bones** - just enough to work, nothing extra.

**What this means:**
- Implement ONLY the core features listed in requirements
- Models should be complete and working (with Codable)
- Views should be complete and working (nice UI)
- Service and ViewModel should be INCOMPLETE (user implements)
- NO extra features, NO fancy animations, NO over-engineering
- NO explicit "TODO" comments (use `fatalError("Not implemented")` instead)

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
- [ ] `README.md` exists with requirements and API docs
- [ ] `INTERVIEW_GUIDE.md` exists with interview approach
- [ ] `PROJECT_STRUCTURE.md` exists with detailed file descriptions
- [ ] `SETUP.md` exists with setup instructions
- [ ] `SOLUTION_CHECKLIST.md` exists with verification checklist
- [ ] `.xcodeproj` opens in Xcode without errors
- [ ] App builds and runs (⌘+R)
- [ ] UI displays correctly (Views are complete)
- [ ] Models are complete with Codable conformance
- [ ] Mock data is provided in `Helpers/MockData.swift`
- [ ] Service and ViewModel are INCOMPLETE (user implements)
- [ ] No explicit "TODO" comments (use `fatalError("Not implemented")`)

---

## Example Workflow

**User:** "Create me an iOS interview project"

**Agent:**
1. **Ask:** "Are you looking for a **45-minute interview** or a **take-home project**?"
2. **User responds:** "45-minute interview"
3. **Agent:**
   - Chooses simple topic: GitHub repository search
   - Creates `03_github_repo_search_attempt1/`
   - Writes README.md (requirements and API documentation)
   - Writes INTERVIEW_GUIDE.md (interview approach)
   - Writes PROJECT_STRUCTURE.md (detailed file descriptions)
   - Writes SETUP.md (setup and running instructions)
   - Writes SOLUTION_CHECKLIST.md (verification checklist)
   - Creates brand new Xcode project from scratch (not copying)
   - Creates complete Models with Codable
   - Creates complete Views with working UI
   - Creates incomplete Service (with `fatalError("Not implemented")`)
   - Creates incomplete ViewModel (with TODO comments in method bodies)
   - Includes mock JSON data in `Helpers/MockData.swift`
4. **Agent tells user:** "Done! Open `03_github_repo_search_attempt1/GitHubRepoSearchApp.xcodeproj` in Xcode and read `README.md` to start."

---

## Important Principles

1. **Always ask 45-min vs take-home first** - Scope differs significantly
2. **DO NOT search the internet** - Just create mock JSON data yourself
3. **Create projects from scratch** - Do NOT copy existing .xcodeproj files
4. **Keep it bare bones** - Minimal but functional, no over-engineering
5. **Complete what's needed for UI** - Models and Views should work perfectly
6. **Leave business logic incomplete** - Service and ViewModel for user to implement
7. **Use `fatalError("Not implemented")`** - Instead of explicit TODO comments
8. **Create 5 documentation files** - README, INTERVIEW_GUIDE, PROJECT_STRUCTURE, SETUP, SOLUTION_CHECKLIST
9. **Zero setup - project runs immediately** - App should build and show UI out of the box
10. **SwiftUI only, modern Swift patterns** - async/await, Codable, @Published, @MainActor
11. **Production-ready code quality** - Not hackathon-level, clean and professional

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
