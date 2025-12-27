# Claude Agent Instructions for iOS Interview Practice Projects

## 🎯 Quick Summary

When user says: **"Create me a [FEATURE] interview project"**

You create:
1. **Working Xcode project** that opens and runs immediately (no setup!)
2. **Functional UI** with SwiftUI layouts ready to use
3. **TODO comments** where engineer implements core logic (Models, Services, ViewModels)
4. **Markdown guides** (README, INTERVIEW_GUIDE, SOLUTION_CHECKLIST, PROJECT_STRUCTURE)
5. **SOLUTION.md** with complete working implementation for reference

**Reference:** Use `01_weather_app_attempt1/` as your template for EVERYTHING (structure, style, content, code patterns)

## Purpose
This file contains instructions for Claude agents to generate ready-to-run iOS interview practice projects. When a user requests a new interview project, create a complete, immediately-runnable Xcode project with TODO markers where the engineer needs to implement code.

## User Command Examples
- "Create me a sample project to create a feature that can be built in 45 mins for an iOS engineer"
- "Generate a new interview challenge for a photo gallery app"
- "Make me a recipe finder interview project"

**Your job:** Create a complete folder with a working Xcode project that the user can **open and start coding immediately**—just like in a real interview. Zero setup time!

## Reference Project
**CRITICAL:** Use `/01_weather_app_attempt1/` as your reference for:
- Folder structure
- File naming conventions
- TODO comment style
- Level of implementation vs. TODOs
- Markdown file tone and content

## Project Structure Template
Each interview project MUST follow this exact structure:

```
[NN]_[feature]_app_attempt1/
├── README.md                          # Project requirements (see 01_weather_app_attempt1/README.md)
├── INTERVIEW_GUIDE.md                 # Interview approach guide (see reference)
├── SOLUTION_CHECKLIST.md              # Verification checklist (see reference)
├── PROJECT_STRUCTURE.md               # Getting started guide (see reference)
└── [AppName]/                         # ⚠️ WORKING XCODE PROJECT - Must open in Xcode immediately
    ├── [AppName].xcodeproj/           # ✅ Created and configured
    │   └── project.pbxproj            # ✅ Valid Xcode project file
    │
    └── [AppName]/                     # Main app target
        ├── [AppName]App.swift         # ✅ SwiftUI entry point (working)
        ├── ContentView.swift          # ✅ Optional: can be removed if not needed
        ├── Info.plist                 # ✅ App configuration
        ├── Assets.xcassets/           # ✅ Asset catalog
        │
        ├── Models/
        │   └── [Feature]Model.swift   # ⚠️ Has structure + TODO comments
        │
        ├── Services/
        │   └── [Feature]Service.swift # ⚠️ Has method signatures + TODO implementation
        │
        ├── ViewModels/
        │   └── [Feature]ViewModel.swift # ⚠️ Has @Published properties + TODO logic
        │
        ├── Views/
        │   └── [Feature]View.swift    # ✅ Functional UI layout (engineer fills in logic)
        │
        └── Helpers/
            └── MockData.swift         # ✅ Sample data for testing (optional)
```

**✅ = Fully working code**
**⚠️ = Working structure with TODO comments where engineer implements logic**

## Step-by-Step: Creating a New Interview Project

### Step 1: Understand the Feature Request
When the user says "create a [FEATURE] interview project", determine:
1. **Feature scope** - What API/data source makes sense?
2. **Core functionality** - Search? List? Detail view? CRUD?
3. **Time target** - Default to 45 minutes unless user specifies

### Step 2: Choose Challenge Parameters

**Challenge Type** (pick one that fits):
- **API Integration** - Fetch and display data from REST API (most common)
- **List + Detail** - Display collection, navigate to detail screen
- **Search/Filter** - User searches and sees filtered results
- **CRUD Operations** - Create, read, update, delete items
- **Data Persistence** - Save data locally (bonus feature)

**Popular Challenge Ideas:**
- Weather app (API: OpenWeatherMap)
- Recipe finder (API: Spoonacular, TheMealDB)
- Photo gallery (API: Unsplash, Pexels)
- Movie browser (API: TMDB)
- News feed (API: NewsAPI)
- GitHub repo search (API: GitHub REST API)
- Book search (API: Google Books)

**Difficulty:**

- **45 min** = Simple list + API integration (default)
- **60 min** = List + detail + search + state management

### Step 3: Create the Xcode Project

**CRITICAL:** The Xcode project MUST be immediately runnable. Follow these steps:

1. **Copy the reference project structure:**
   ```bash
   # Use 01_weather_app_attempt1/WeaherApp/ as your template
   # Copy the .xcodeproj structure exactly
   ```

2. **Create working Xcode project files:**
   - `.xcodeproj/project.pbxproj` - Use reference as template, update UUIDs and names
   - `[AppName]App.swift` - SwiftUI entry point (fully working)
   - `Info.plist` - Basic app configuration
   - `Assets.xcassets/` - Asset catalog (can be empty)

3. **The engineer should be able to:**
   - ✅ Open `[AppName].xcodeproj` in Xcode
   - ✅ Press ⌘+R and see the app launch on simulator
   - ✅ See a basic UI (search field, button, etc.)
   - ⚠️ Fill in TODO comments to make features work

4. **What NOT to do:**
   - ❌ Don't create just Swift files without an Xcode project
   - ❌ Don't require the engineer to "create a new project first"
   - ❌ Don't provide setup scripts—the project should just work

### Step 4: Create the Folder Structure

**Use `/01_weather_app_attempt1/` as your EXACT template:**

1. Create folder: `[NN]_[feature]_app_attempt1/`
2. Copy structure from weather app:
   - Same markdown files (README, INTERVIEW_GUIDE, etc.)
   - Same Xcode project structure
   - Same Models/, Services/, ViewModels/, Views/ folders
3. Update all content for the new feature
4. Keep the same TODO comment style

### Step 5: Required Markdown Files

Copy the style and structure from `01_weather_app_attempt1/` for these files:

#### README.md (see 01_weather_app_attempt1/README.md)
- Overview of the challenge
- Time allocation (45-60 min)
- Core requirements (must-have features)
- Technical requirements (architecture, error handling, UI)
- Bonus features (nice-to-have)
- Evaluation criteria
- **API information** (endpoints, sample JSON response, auth if needed)
- Getting started instructions
- Interview tips

#### INTERVIEW_GUIDE.md (see reference)
- How to approach the interview (phases)
- Example thought process and dialogue
- Key technical topics to discuss
- Time management breakdown
- Red flags to avoid
- Green flags to demonstrate

#### SOLUTION_CHECKLIST.md (see reference)
- Core functionality checklist
- Code organization checklist
- Error handling checklist
- UI/UX checklist
- iOS best practices checklist
- Architecture checklist
- Bonus features checklist
- Self-review questions
- Interview performance rubric

#### PROJECT_STRUCTURE.md (see reference)
- Visual directory tree
- Getting started steps (should be: "Open .xcodeproj and press ⌘+R")
- File descriptions
- Implementation tips

#### SOLUTION.md ⚠️ NEW REQUIREMENT
**This file contains the complete, working implementation for another agent to use as reference.**

Include:
- Complete implementations of all TODO sections
- Working Model parsing
- Working Service with API calls
- Working ViewModel with state management
- Working View (if UI needs completion)
- Code should be production-quality
- Include comments explaining key decisions

**Purpose:** Another Claude agent can read SOLUTION.md to generate a complete working example.

## What Code to Write vs. Leave as TODO

**Study the weather app reference to understand the balance.** Here's the guideline:

### ✅ Fully Implement (Engineer can run immediately)
- **[AppName]App.swift** - SwiftUI entry point, working
- **Views/** - Functional UI layout (TextField, Button, List, NavigationStack)
- **ViewModels/** - `@Published` properties, state variables, method signatures
- **Info.plist** - Basic configuration
- **Assets.xcassets/** - Empty asset catalog
- **MockData.swift** - Sample JSON data for testing

### ⚠️ Provide Structure + TODO Comments (Engineer implements)
- **Models/** - Struct definitions with property names, add TODO for custom initializers or computed properties
- **Services/** - Method signatures with parameters and return types, add TODO in body
- **ViewModel logic** - Add TODO comments in methods where engineer implements API calls, state updates, error handling

### Example (from WeatherService.swift):
```swift
class WeatherService {
    static let shared = WeatherService()
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"

    // TODO: Implement method to fetch weather for a city
    // Steps:
    // 1. Construct URL with query parameters
    // 2. Create URLRequest
    // 3. Use URLSession to make network call
    // 4. Parse JSON response
    // 5. Handle errors
    func fetchWeather(for city: String) async throws -> WeatherResponse {
        // Your implementation here
    }
}
```

## Important Principles

**Keep it realistic:**
- Use actual public APIs (provide sample JSON if API requires auth)
- Focus on iOS fundamentals (networking, UI, state management)
- Mirror real interview time constraints

**Make it educational:**
- Add helpful TODO comments with hints
- Include example API responses in README
- Provide MockData for offline testing

**SwiftUI Only:**
- All projects use SwiftUI exclusively
- Use modern Swift (async/await, @Published, Codable)
- Follow MVVM architecture pattern

**Zero setup time:**
- Engineer opens .xcodeproj and immediately starts coding
- No "create a project first" or setup scripts
- Project builds and runs out of the box

## Free APIs for Interviews

- **Weather**: OpenWeatherMap, WeatherAPI
- **Photos**: Unsplash, Pexels, Pixabay
- **News**: NewsAPI, Guardian API
- **Movies**: TMDB, OMDB
- **Books**: Google Books, Open Library
- **GitHub**: GitHub REST API
- **Food**: TheMealDB, Spoonacular
- **Random**: Random User Generator, JSONPlaceholder

## Agent Workflow: How to Create a New Project

When the user requests a new interview project, follow these steps:

### 1. Determine Project Details
- Feature name (e.g., "Recipe Finder", "Photo Gallery")
- API to use (or suggest one from the list above)
- Project number (check existing projects, increment by 1)
- Folder name: `[NN]_[feature]_app_attempt1/`

### 2. Use the Weather App as Template
- **Read** `01_weather_app_attempt1/` files to understand structure
- **Copy** the Xcode project structure (update names/UUIDs as needed)
- **Mirror** the markdown file style and content
- **Adapt** all content to the new feature

### 3. Create All Required Files
✅ Create these files in order:

1. **Markdown files:**
   - `README.md` - Based on weather app README
   - `INTERVIEW_GUIDE.md` - Copy structure from reference
   - `SOLUTION_CHECKLIST.md` - Copy structure from reference
   - `PROJECT_STRUCTURE.md` - Update folder tree for new feature
   - `SOLUTION.md` - Complete working implementation

2. **Xcode project files:**
   - `[AppName].xcodeproj/project.pbxproj` - Copy from weather app, update references
   - `[AppName]/[AppName]App.swift` - SwiftUI entry point
   - `[AppName]/Info.plist` - Basic config
   - `[AppName]/Assets.xcassets/Contents.json` - Asset catalog

3. **Swift source files:**
   - `Models/[Feature]Model.swift` - Structs with TODO comments
   - `Services/[Feature]Service.swift` - Method signatures with TODO
   - `ViewModels/[Feature]ViewModel.swift` - `@Published` vars + TODO methods
   - `Views/[Feature]View.swift` - Functional UI layout
   - `Helpers/MockData.swift` - Sample JSON data (optional)

### 4. Verify the Project
Before finishing, ensure:
- ✅ `.xcodeproj` file can be opened in Xcode
- ✅ Project builds without errors (⌘+B)
- ✅ App runs on simulator (⌘+R)
- ✅ UI displays correctly (even with empty state)
- ✅ TODO comments are clear and helpful
- ✅ All markdown files are complete

## Code Templates Reference

**DO NOT copy these templates verbatim.** Instead:
1. **Read the actual files** from `01_weather_app_attempt1/WeaherApp/WeaherApp/`
2. **Adapt the patterns** to your new feature
3. **Maintain the same style** of TODO comments and code structure

Key files to reference:
- `WeaherAppApp.swift` - SwiftUI entry point pattern
- `Models/WeatherModel.swift` - How to structure models with TODOs
- `Services/WeatherService.swift` - Service layer with method signatures + TODOs
- `ViewModels/WeatherViewModel.swift` - ViewModel pattern with `@Published` properties
- `Views/WeatherView.swift` - Functional UI with state management
- `Helpers/MockData.swift` - How to provide sample data

## Final Checklist Before Submitting to User

Before you tell the user "Done!", verify:

- [ ] Created folder `[NN]_[feature]_app_attempt1/`
- [ ] All markdown files exist (README, INTERVIEW_GUIDE, SOLUTION_CHECKLIST, PROJECT_STRUCTURE, SOLUTION)
- [ ] `.xcodeproj` file is valid and can be opened
- [ ] All Swift files compile without errors
- [ ] App launches on simulator showing basic UI
- [ ] TODO comments are clear and helpful
- [ ] Mock data is provided (if using API)
- [ ] SOLUTION.md contains complete working implementation
- [ ] All file paths match the structure template
- [ ] Followed the weather app reference style

## Example User Prompts and Responses

**User:** "Create me a sample project for a recipe finder that can be built in 45 mins"

**Agent Response:**
1. Read `01_weather_app_attempt1/` to understand structure
2. Determine: Recipe finder, use TheMealDB API, folder: `03_recipe_finder_app_attempt1/`
3. Create all markdown files (README with recipe-specific requirements, etc.)
4. Copy `.xcodeproj` from weather app, update all references to "RecipeApp"
5. Create Swift files adapted from weather app patterns:
   - `RecipeModel.swift` (with Recipe, RecipeResponse structs)
   - `RecipeService.swift` (with fetchRecipes method signature + TODO)
   - `RecipeViewModel.swift` (@Published recipes, isLoading, etc.)
   - `RecipeView.swift` (functional search UI)
   - `MockData.swift` (sample recipe JSON)
6. Write `SOLUTION.md` with complete working code
7. Build and run to verify
8. Tell user: "Created 03_recipe_finder_app_attempt1/ - open RecipeApp.xcodeproj to start!"

## Summary: Key Success Criteria

✅ **User opens .xcodeproj** → Project opens in Xcode without errors
✅ **User presses ⌘+R** → App builds and launches on simulator
✅ **User sees UI** → Search field, button, basic layout visible
✅ **User reads README** → Understands requirements and API details
✅ **User sees TODOs** → Knows exactly what to implement
✅ **User fills TODOs** → Can complete challenge in 45-60 minutes
✅ **Another agent reads SOLUTION.md** → Can generate working example
