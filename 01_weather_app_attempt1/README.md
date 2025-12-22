# iOS Interview Challenge: Weather App

## Overview
Build a simple weather application that fetches and displays weather data for a given city.

## Time Allocation
- **In-person interview**: 45-60 minutes
- **Take-home**: 2-3 hours

## Requirements

### Core Features (Must Have)
1. **Search Functionality**
   - User can search for a city by name
   - Display search results
   	   - What shows in the search result? 
   	   - Does tapping it go to the weather display? 

2. **Weather Display**
   - Show current temperature
   - Show weather condition (e.g., sunny, cloudy, rainy)
   - Show city name
   - Display weather icon/image

   Are all the compoentns here provide by the API or will the app need to handle some logic to deofuscate this information like weather icon/image, weather condition. 

3. **API Integration**
   - Use OpenWeatherMap API (or mock data provided)
      - Is this API provided? 
   - Handle network requests properly
      - WHat does this mean? What exactly did you want? Just handle error and success cases? 
   - Parse JSON response

### Technical Requirements
- Use UIKit or SwiftUI (your choice)
- Follow iOS best practices and design patterns
- Handle loading states
- Handle error states (no internet, invalid city, etc.)
- Clean, readable code with proper naming conventions

### Bonus Features (Nice to Have)
- Recent searches history
- Pull to refresh
- Multiple cities/favorites
- Unit tests
- 5-day forecast
- Custom animations

## What We're Evaluating
1. **Code Organization** - Proper separation of concerns, clear architecture
2. **Error Handling** - Edge cases, network failures, user feedback
3. **UI/UX** - Clean interface, loading states, error messages
4. **Communication** - Ability to explain your decisions and trade-offs
5. **iOS Fundamentals** - Proper use of iOS patterns and frameworks

## API Information

### OpenWeatherMap API
- **Endpoint**: `https://api.openweathermap.org/data/2.5/weather`
- **Parameters**:
  - `q`: city name (e.g., "San Francisco")
  - `appid`: API key (use: `demo` for mock, or sign up for free)
  - `units`: `metric` or `imperial`

### Sample API Response
```json
{
  "name": "San Francisco",
  "main": {
    "temp": 18.5,
    "feels_like": 17.2,
    "humidity": 65
  },
  "weather": [
    {
      "main": "Clouds",
      "description": "scattered clouds",
      "icon": "03d"
    }
  ]
}
```

## Getting Started

1. Review the boilerplate code in this project
2. Implement the required features
3. Test your implementation
4. Be ready to explain your architectural decisions

## Interview Tips
- **Think out loud** - Explain your approach before coding
- **Ask clarifying questions** - Don't make assumptions
- **Start simple** - Get basic functionality working first
- **Refactor as you go** - Show you can improve code iteratively
- **Discuss trade-offs** - Explain why you chose certain approaches

Good luck! 🚀


Approach: 
Start with building out the API and services to handle the data that is coming in. 
API needs to be responsive. Use async/await with a URL session. 

Service will be in charge of calling the APIs and returning the model object that the view needs 

WE will use MVVM architecture. 
so t he viewmodel will directly call the services.
The view will be made to purely render UI only logic it may have is loading state but that will likely be passed on as the responsibiltiy of the ViewModel as it should modify loading based on waiting for the API reposne for example 


For UI 

We will use the standard iOS Search bar. 
v1 we will use a text field and just send textfield input as the query paramerter for the API. U

Units can be user modified. but for not we will use imperial and have htat as an optimization for alter. 


Later we could use another API to get a list of cities that is stored locally. User can use a search bar to search for viable citeis and only tapping on the city will trigger an API call. 

V1 on enter, we will siwthc to loading state while waiting for response. ONce repsnse received, we will navigate push to another view to display the weather deatisl. 

Anither way would be doing a split where, top half is weather details bottom half for searhfching and quierying. This is good but its feels cluttered for an mobile app. Help easiest havfe a search bar for now in the middle of the scfreen that is searchable so it can adhere to the default iOS search APIs. 

THen push as a simple adpp. Its very bland and lots empty space but a good starting point. 