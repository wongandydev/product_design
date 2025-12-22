# Project Structure

```
01_weather_app_attempt1/
├── README.md                          # Main project requirements
├── INTERVIEW_GUIDE.md                 # How to approach the interview
├── SOLUTION_CHECKLIST.md              # What to verify before submitting
├── PROJECT_STRUCTURE.md               # This file
│
└── WeatherApp/
    ├── Models/
    │   └── WeatherModel.swift         # Data models (TODO: implement)
    │
    ├── Services/
    │   └── WeatherService.swift       # Networking layer (TODO: implement)
    │
    ├── ViewControllers/
    │   └── WeatherViewController.swift # UIKit view controller (TODO: implement)
    │
    └── SwiftUI/
        └── WeatherView.swift          # SwiftUI alternative (TODO: implement)
```

## Getting Started

1. **Read README.md** - Understand the requirements
2. **Read INTERVIEW_GUIDE.md** - Learn how to approach the problem
3. **Choose your approach** - UIKit or SwiftUI
4. **Start implementing** - Fill in the TODO sections
5. **Use SOLUTION_CHECKLIST.md** - Verify completeness

## File Descriptions

### Models/WeatherModel.swift
Define your data structures here:
- API response model (matches JSON from OpenWeatherMap)
- App data model (what your UI needs)
- Use Codable for JSON parsing

### Services/WeatherService.swift
Implement networking here:
- API endpoint construction
- URLSession configuration
- Error handling
- Response parsing

### ViewControllers/WeatherViewController.swift (UIKit)
Build your UI here:
- Search text field
- Weather display labels
- Loading indicator
- Error handling UI
- Layout constraints

### SwiftUI/WeatherView.swift (SwiftUI)
Alternative SwiftUI implementation:
- View layout
- ViewModel for state management
- ObservableObject pattern
- Combine publishers

## Choose Your Path

### Option 1: UIKit (Traditional)
- Use `WeatherViewController.swift`
- Programmatic UI or Storyboards (your choice)
- Delegates and closures for callbacks
- Manual layout with Auto Layout

### Option 2: SwiftUI (Modern)
- Use `WeatherView.swift`
- Declarative UI syntax
- @StateObject and @Published for state
- MVVM pattern fits naturally

## Tips

- You don't need to implement both UIKit and SwiftUI
- Choose the one you're most comfortable with
- The interviewer wants to see your best work
- Focus on code quality over feature quantity
