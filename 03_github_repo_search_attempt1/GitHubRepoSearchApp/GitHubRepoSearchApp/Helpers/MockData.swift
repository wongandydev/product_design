import Foundation

struct MockData {
    static let searchResponseJSON = """
    {
      "total_count": 5,
      "incomplete_results": false,
      "items": [
        {
          "id": 44838949,
          "name": "swift",
          "full_name": "apple/swift",
          "owner": {
            "login": "apple",
            "avatar_url": "https://avatars.githubusercontent.com/u/10639145?v=4"
          },
          "description": "The Swift Programming Language",
          "html_url": "https://github.com/apple/swift",
          "stargazers_count": 65000,
          "language": "C++",
          "forks_count": 10500,
          "open_issues_count": 300,
          "watchers_count": 65000
        },
        {
          "id": 12345678,
          "name": "SwiftUI",
          "full_name": "Jinxiansen/SwiftUI",
          "owner": {
            "login": "Jinxiansen",
            "avatar_url": "https://avatars.githubusercontent.com/u/18518861?v=4"
          },
          "description": "SwiftUI Framework Learning and Usage Guide",
          "html_url": "https://github.com/Jinxiansen/SwiftUI",
          "stargazers_count": 5200,
          "language": "Swift",
          "forks_count": 500,
          "open_issues_count": 10,
          "watchers_count": 5200
        },
        {
          "id": 23456789,
          "name": "Alamofire",
          "full_name": "Alamofire/Alamofire",
          "owner": {
            "login": "Alamofire",
            "avatar_url": "https://avatars.githubusercontent.com/u/7774181?v=4"
          },
          "description": "Elegant HTTP Networking in Swift",
          "html_url": "https://github.com/Alamofire/Alamofire",
          "stargazers_count": 40000,
          "language": "Swift",
          "forks_count": 7500,
          "open_issues_count": 25,
          "watchers_count": 40000
        },
        {
          "id": 34567890,
          "name": "RxSwift",
          "full_name": "ReactiveX/RxSwift",
          "owner": {
            "login": "ReactiveX",
            "avatar_url": "https://avatars.githubusercontent.com/u/6407041?v=4"
          },
          "description": "Reactive Programming in Swift",
          "html_url": "https://github.com/ReactiveX/RxSwift",
          "stargazers_count": 24000,
          "language": "Swift",
          "forks_count": 4200,
          "open_issues_count": 15,
          "watchers_count": 24000
        },
        {
          "id": 45678901,
          "name": "SnapKit",
          "full_name": "SnapKit/SnapKit",
          "owner": {
            "login": "SnapKit",
            "avatar_url": "https://avatars.githubusercontent.com/u/11927259?v=4"
          },
          "description": "A Swift Autolayout DSL for iOS & OS X",
          "html_url": "https://github.com/SnapKit/SnapKit",
          "stargazers_count": 19500,
          "language": "Swift",
          "forks_count": 1900,
          "open_issues_count": 8,
          "watchers_count": 19500
        }
      ]
    }
    """.data(using: .utf8)!
}
