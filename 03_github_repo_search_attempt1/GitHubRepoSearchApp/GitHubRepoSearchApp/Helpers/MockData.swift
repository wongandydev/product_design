import Foundation

struct MockData {
    static let searchResponseJSON = """
    {
      "total_count": 15,
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
          "name": "react",
          "full_name": "facebook/react",
          "owner": {
            "login": "facebook",
            "avatar_url": "https://avatars.githubusercontent.com/u/69631?v=4"
          },
          "description": "A declarative, efficient, and flexible JavaScript library for building user interfaces",
          "html_url": "https://github.com/facebook/react",
          "stargazers_count": 220000,
          "language": "JavaScript",
          "forks_count": 45000,
          "open_issues_count": 1200,
          "watchers_count": 220000
        },
        {
          "id": 23456789,
          "name": "vue",
          "full_name": "vuejs/vue",
          "owner": {
            "login": "vuejs",
            "avatar_url": "https://avatars.githubusercontent.com/u/6128107?v=4"
          },
          "description": "Vue.js is a progressive JavaScript framework for building user interfaces",
          "html_url": "https://github.com/vuejs/vue",
          "stargazers_count": 207000,
          "language": "JavaScript",
          "forks_count": 33500,
          "open_issues_count": 350,
          "watchers_count": 207000
        },
        {
          "id": 34567890,
          "name": "tensorflow",
          "full_name": "tensorflow/tensorflow",
          "owner": {
            "login": "tensorflow",
            "avatar_url": "https://avatars.githubusercontent.com/u/15658638?v=4"
          },
          "description": "An Open Source Machine Learning Framework for Everyone",
          "html_url": "https://github.com/tensorflow/tensorflow",
          "stargazers_count": 185000,
          "language": "Python",
          "forks_count": 74000,
          "open_issues_count": 2100,
          "watchers_count": 185000
        },
        {
          "id": 45678901,
          "name": "django",
          "full_name": "django/django",
          "owner": {
            "login": "django",
            "avatar_url": "https://avatars.githubusercontent.com/u/27804?v=4"
          },
          "description": "The Web framework for perfectionists with deadlines",
          "html_url": "https://github.com/django/django",
          "stargazers_count": 77000,
          "language": "Python",
          "forks_count": 31000,
          "open_issues_count": 180,
          "watchers_count": 77000
        },
        {
          "id": 56789012,
          "name": "golang",
          "full_name": "golang/go",
          "owner": {
            "login": "golang",
            "avatar_url": "https://avatars.githubusercontent.com/u/4314092?v=4"
          },
          "description": "The Go programming language",
          "html_url": "https://github.com/golang/go",
          "stargazers_count": 120000,
          "language": "Go",
          "forks_count": 17500,
          "open_issues_count": 8500,
          "watchers_count": 120000
        },
        {
          "id": 67890123,
          "name": "kubernetes",
          "full_name": "kubernetes/kubernetes",
          "owner": {
            "login": "kubernetes",
            "avatar_url": "https://avatars.githubusercontent.com/u/13629408?v=4"
          },
          "description": "Production-Grade Container Orchestration",
          "html_url": "https://github.com/kubernetes/kubernetes",
          "stargazers_count": 108000,
          "language": "Go",
          "forks_count": 38500,
          "open_issues_count": 2700,
          "watchers_count": 108000
        },
        {
          "id": 78901234,
          "name": "rust",
          "full_name": "rust-lang/rust",
          "owner": {
            "login": "rust-lang",
            "avatar_url": "https://avatars.githubusercontent.com/u/5430905?v=4"
          },
          "description": "Empowering everyone to build reliable and efficient software",
          "html_url": "https://github.com/rust-lang/rust",
          "stargazers_count": 95000,
          "language": "Rust",
          "forks_count": 12300,
          "open_issues_count": 9800,
          "watchers_count": 95000
        },
        {
          "id": 89012345,
          "name": "SwiftUI-Introspect",
          "full_name": "siteline/SwiftUI-Introspect",
          "owner": {
            "login": "siteline",
            "avatar_url": "https://avatars.githubusercontent.com/u/13954650?v=4"
          },
          "description": "Introspect underlying UIKit components from SwiftUI",
          "html_url": "https://github.com/siteline/SwiftUI-Introspect",
          "stargazers_count": 5200,
          "language": "Swift",
          "forks_count": 340,
          "open_issues_count": 25,
          "watchers_count": 5200
        },
        {
          "id": 90123456,
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
          "id": 11223344,
          "name": "angular",
          "full_name": "angular/angular",
          "owner": {
            "login": "angular",
            "avatar_url": "https://avatars.githubusercontent.com/u/139426?v=4"
          },
          "description": "The modern web developer's platform",
          "html_url": "https://github.com/angular/angular",
          "stargazers_count": 95000,
          "language": "TypeScript",
          "forks_count": 25000,
          "open_issues_count": 1500,
          "watchers_count": 95000
        },
        {
          "id": 22334455,
          "name": "flask",
          "full_name": "pallets/flask",
          "owner": {
            "login": "pallets",
            "avatar_url": "https://avatars.githubusercontent.com/u/16748505?v=4"
          },
          "description": "The Python micro framework for building web applications",
          "html_url": "https://github.com/pallets/flask",
          "stargazers_count": 66000,
          "language": "Python",
          "forks_count": 16000,
          "open_issues_count": 45,
          "watchers_count": 66000
        },
        {
          "id": 33445566,
          "name": "spring-boot",
          "full_name": "spring-projects/spring-boot",
          "owner": {
            "login": "spring-projects",
            "avatar_url": "https://avatars.githubusercontent.com/u/317776?v=4"
          },
          "description": "Spring Boot makes it easy to create stand-alone, production-grade Spring based Applications",
          "html_url": "https://github.com/spring-projects/spring-boot",
          "stargazers_count": 73000,
          "language": "Java",
          "forks_count": 40000,
          "open_issues_count": 650,
          "watchers_count": 73000
        },
        {
          "id": 44556677,
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
          "id": 55667788,
          "name": "docker",
          "full_name": "docker/docker-ce",
          "owner": {
            "login": "docker",
            "avatar_url": "https://avatars.githubusercontent.com/u/5429470?v=4"
          },
          "description": "Docker CE (Community Edition) is the open source containerization platform",
          "html_url": "https://github.com/docker/docker-ce",
          "stargazers_count": 6500,
          "language": "Go",
          "forks_count": 1800,
          "open_issues_count": 120,
          "watchers_count": 6500
        }
      ]
    }
    """.data(using: .utf8)!
}
