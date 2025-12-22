# Interview Guide - Weather App Challenge

## How to Approach This Interview

### Phase 1: Understanding (5 minutes)
**Read the requirements and ask clarifying questions:**
- Should I use UIKit or SwiftUI?
- Do you want me to use real API or mock data?
- How should I handle offline scenarios?
- Any specific architectural pattern preference? (MVC, MVVM, etc.)
- Are there performance concerns I should consider?

### Phase 2: Planning (5-10 minutes)
**Think out loud and explain your approach:**

1. **Architecture Decision**
   - "I'll use MVVM because it separates business logic from UI"
   - "I'll create a separate networking layer for testability"
   - Explain why you're making these choices

2. **Identify Core Components**
   - Models (data structures)
   - Service layer (API calls)
   - View layer (UI)
   - ViewModel (if using MVVM)

3. **Plan Implementation Order**
   - "I'll start with the model to define the data structure"
   - "Then build the networking layer"
   - "Finally implement the UI"
   - This shows you can prioritize and work systematically

### Phase 3: Implementation (30-40 minutes)
**Code while explaining your decisions:**

#### Start with Models
```swift
// Example thought process:
// "First, I'll look at the API response and create matching models"
// "I'll use Codable for easy JSON parsing"
// "I'll keep the API model separate from UI model for flexibility"
```

#### Build Service Layer
```swift
// Example thought process:
// "I'll use URLSession for networking"
// "I'll make this a singleton since we only need one instance"
// "I'll use Result type for clean error handling"
```

#### Create UI
```swift
// Example thought process:
// "I'll start with basic UI to test the flow"
// "Then add loading states and error handling"
// "I'll use Auto Layout programmatically" (or explain SwiftUI approach)
```

### Phase 4: Testing & Polish (5-10 minutes)
- Test happy path
- Test error scenarios
- Add loading indicators
- Improve UX

## Common Interview Talking Points

### 1. Error Handling
**Bad**: Silently fail or crash
**Good**: "I'm handling three error cases: network failure, invalid city, and parsing errors. Each shows a user-friendly message."

### 2. Architecture
**Bad**: Put everything in one view controller
**Good**: "I'm separating concerns - WeatherService handles networking, Model handles data, ViewController handles UI coordination."

### 3. Async Operations
**Bad**: Block main thread
**Good**: "I'm making network calls on background queue and updating UI on main thread to keep app responsive."

### 4. Code Quality
**Bad**: Magic strings, no comments, unclear naming
**Good**: "I'm using clear variable names, extracting constants, and adding comments where logic isn't obvious."

## Key Topics You Should Be Ready to Discuss

### Networking
- URLSession vs third-party libraries (Alamofire)
- Async/await vs completion handlers
- Error handling strategies
- Request/response parsing

### UI
- UIKit vs SwiftUI trade-offs
- Auto Layout (constraints, stack views)
- Handling keyboard
- Loading states and error states

### Architecture
- MVC vs MVVM vs VIPER
- Dependency injection
- Separation of concerns
- Testability

### Swift Language Features
- Optionals and unwrapping strategies
- Result type
- Codable protocol
- Access control (private, public, etc.)

### iOS Fundamentals
- App lifecycle
- View controller lifecycle
- Memory management (ARC, retain cycles)
- Threading (main queue, background queues)

## Example Dialogue

**Interviewer**: "Let's start by implementing the weather fetch functionality."

**You**: "Sure! Let me think about this step by step. First, I need to understand the API endpoint structure. Looking at the requirements, I see we need to construct a URL with the city name and API key.

I'll create a WeatherService class to handle this. I'm choosing a class over a struct because services typically manage state and we want reference semantics. I'll make it a singleton since we only need one instance throughout the app.

For the network call, I'll use URLSession - it's built-in, well-tested, and sufficient for this use case. If we needed advanced features like request retrying or certificate pinning, I might consider Alamofire, but that would be over-engineering for this requirement.

I'll use a completion handler with Result type for clean error handling. This gives us type-safe success and failure cases. Let me start coding this..."

## Time Management Tips

- **0-5 min**: Ask questions, clarify requirements
- **5-15 min**: Explain architecture, plan approach
- **15-45 min**: Implement core features
- **45-50 min**: Add error handling, polish
- **50-60 min**: Test, discuss improvements

## Red Flags to Avoid

- Starting to code without explaining approach
- Not handling errors
- Ignoring edge cases
- Writing untestable code
- Not asking any questions
- Going silent for long periods
- Over-engineering simple requirements

## Green Flags to Demonstrate

- Clear communication of thought process
- Asking clarifying questions
- Systematic approach (plan before coding)
- Clean, readable code
- Proper error handling
- Discussion of trade-offs
- Awareness of edge cases
- Testing mindset
