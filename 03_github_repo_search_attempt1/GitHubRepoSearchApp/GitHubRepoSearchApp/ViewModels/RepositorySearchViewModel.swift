import Foundation

@MainActor
class RepositorySearchViewModel: ObservableObject {
    @Published var repositories: [Repository] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var searchText: String = ""

    private let service = GitHubService.shared

    func search() async {
        // TODO: Implement this method
        // 1. Validate searchText is not empty
        // 2. Set isLoading = true
        // 3. Clear previous errorMessage
        // 4. Call service.searchRepositories(query: searchText)
        // 5. Handle success: update repositories
        // 6. Handle error: update errorMessage
        // 7. Set isLoading = false
    }
}
