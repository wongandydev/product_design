import SwiftUI

struct RepositoryListView: View {
    let repositories: [Repository]

    var body: some View {
        if repositories.isEmpty {
            VStack(spacing: 12) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 50))
                    .foregroundColor(.secondary)
                Text("No results found")
                    .font(.title3)
                    .foregroundColor(.secondary)
                Text("Try searching for a different repository")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            List(repositories) { repo in
                RepositoryRowView(repository: repo)
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    RepositoryListView(repositories: [])
}
