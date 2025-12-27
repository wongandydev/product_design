# Quick Setup Guide

## Opening the Project in Xcode

This project includes boilerplate code and file structure to help you get started immediately.

### Option 1: Create New Xcode Project (Recommended - 1 minute)

1. Open Xcode
2. Select "Create a new Xcode project"
3. Choose **iOS** → **App**
4. Configure your project:
   - **Product Name**: `RecipeApp`
   - **Team**: (Your team or leave as None)
   - **Organization Identifier**: `com.yourname` (or any identifier)
   - **Interface**: Choose **SwiftUI** or **Storyboard** (doesn't matter, you'll replace it)
   - **Language**: Swift
5. **Save Location**: Save inside the `02_recipe_finder_app_attempt1/` folder
   - This will create a `RecipeApp.xcodeproj` file

6. **Add the boilerplate files to your project:**
   - In Xcode, right-click on the `RecipeApp` folder in the Project Navigator
   - Select "Add Files to RecipeApp..."
   - Navigate to and add:
     - `Models/RecipeModel.swift`
     - `Services/RecipeService.swift`
     - `ViewControllers/` folder (if using UIKit)
     - `SwiftUI/` folder (if using SwiftUI)

7. **Replace generated files:**
   - If using **UIKit**: Keep AppDelegate and SceneDelegate from the boilerplate
   - If using **SwiftUI**: Use the RecipeAppApp.swift file (uncomment @main)

8. **You're ready to code!**

### Option 2: Manual Project File Creation (Advanced)

If you're comfortable with Xcode project files, you can manually create the `.xcodeproj` structure. However, Option 1 is much faster.

## What's Included

This project already includes:

### ✅ Boilerplate Files Created

- **AppDelegate.swift** - App lifecycle (UIKit)
- **SceneDelegate.swift** - Window scene management (UIKit)
- **RecipeAppApp.swift** - SwiftUI app entry point
- **RecipeModel.swift** - Complete data models with Codable
- **RecipeService.swift** - Networking service with method stubs
- **RecipeListViewController.swift** - UIKit list view with TODOs
- **RecipeDetailViewController.swift** - UIKit detail view with TODOs
- **RecipeListView.swift** - SwiftUI list view (fully functional UI)
- **RecipeDetailView.swift** - SwiftUI detail view (fully functional UI)
- **Info.plist** - App configuration
- **Assets.xcassets/** - Asset catalog

### 📝 What You Need to Implement

The core functionality you'll build during the interview:

1. **RecipeService.swift**
   - Implement `searchRecipes(query:)` method
   - Parse API responses
   - Handle errors

2. **Recipe Model**
   - Add computed property to parse ingredients (strIngredient1-20)
   - Combine with measures (strMeasure1-20)

3. **Choose Your UI Path:**

   **UIKit Path:**
   - Implement RecipeListViewController UI setup
   - Add UITableView and UISearchBar
   - Implement RecipeDetailViewController layout
   - Handle navigation

   **SwiftUI Path:**
   - Uncomment @main in RecipeAppApp.swift
   - Implement searchRecipes in RecipeListViewModel
   - The UI is already built!

## Choosing UIKit vs SwiftUI

### Use UIKit if:
- You're more comfortable with UIKit
- You want to demonstrate delegates and manual layout
- The interview team works primarily with UIKit

**Starting point for UIKit:**
- Open `SceneDelegate.swift`
- Uncomment the RecipeListViewController initialization
- Start implementing the view controller

### Use SwiftUI if:
- You're more comfortable with SwiftUI
- You want to write less boilerplate
- You want to focus on business logic

**Starting point for SwiftUI:**
- Open `RecipeAppApp.swift`
- Uncomment `@main` (remove @main from AppDelegate.swift)
- Replace `ContentView()` with `RecipeListView()`
- Implement the service layer

## Quick Start Checklist

Before starting your 45-minute timer:

- [ ] Xcode project created and opens successfully
- [ ] All boilerplate files added to project
- [ ] Project compiles (might have warnings, that's okay)
- [ ] You've chosen UIKit or SwiftUI path
- [ ] You've read README.md and understand requirements
- [ ] You've skimmed INTERVIEW_GUIDE.md

## File Structure

```
RecipeApp/
├── RecipeApp/                 # Main app folder
│   ├── AppDelegate.swift      # ✅ Created
│   ├── SceneDelegate.swift    # ✅ Created
│   ├── RecipeAppApp.swift     # ✅ Created (SwiftUI entry)
│   ├── Info.plist             # ✅ Created
│   └── Assets.xcassets/       # ✅ Created
│
├── Models/
│   └── RecipeModel.swift      # ✅ Created (TODO: Add ingredients parser)
│
├── Services/
│   └── RecipeService.swift    # ✅ Created (TODO: Implement API calls)
│
├── ViewControllers/           # UIKit
│   ├── RecipeListViewController.swift    # ✅ Created (TODO: Implement UI)
│   └── RecipeDetailViewController.swift  # ✅ Created (TODO: Implement UI)
│
└── SwiftUI/                   # SwiftUI
    ├── RecipeListView.swift   # ✅ Created (UI done, connect service)
    └── RecipeDetailView.swift # ✅ Created (UI done, parse ingredients)
```

## Tips for Success

1. **Start with the service layer** - Get API working first
2. **Test as you go** - Run the app frequently
3. **Use TODO comments** - We've marked what needs implementation
4. **Don't over-engineer** - Focus on core functionality
5. **Handle errors** - Show user-friendly messages

## Need Help?

- **API not working?** Check README.md for endpoint examples
- **Not sure what to implement?** Check TODO comments in each file
- **Stuck on architecture?** Read INTERVIEW_GUIDE.md
- **Checking completeness?** Use SOLUTION_CHECKLIST.md

Good luck! 🎯
