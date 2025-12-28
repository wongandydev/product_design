import SwiftUI

struct RepositoryRowView: View {
    let repository: Repository

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            // Repository Name
            Text(repository.name)
                .font(.headline)
                .fontWeight(.semibold)

            // Full Name (owner/repo)
            Text(repository.fullName)
                .font(.subheadline)
                .foregroundColor(.secondary)

            // Description
            if let description = repository.description, !description.isEmpty {
                Text(description)
                    .font(.body)
                    .foregroundColor(.primary)
                    .lineLimit(2)
            } else {
                Text("No description available")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .italic()
            }

            // Metadata (Stars and Language)
            HStack(spacing: 12) {
                // Star Count
                Label {
                    Text(formatStarCount(repository.stargazersCount))
                } icon: {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                .font(.caption)

                // Language
                if let language = repository.language, !language.isEmpty {
                    Text(language)
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.blue.opacity(0.2))
                        .foregroundColor(.blue)
                        .cornerRadius(4)
                }
            }
        }
        .padding(.vertical, 6)
    }

    private func formatStarCount(_ count: Int) -> String {
        if count >= 1000 {
            let thousands = Double(count) / 1000.0
            return String(format: "%.1fk", thousands)
        }
        return "\(count)"
    }
}

#Preview {
    let sampleRepo = Repository(
        id: 1,
        name: "swift",
        fullName: "apple/swift",
        description: "The Swift Programming Language",
        htmlUrl: "https://github.com/apple/swift",
        stargazersCount: 65000,
        language: "C++",
        owner: Owner(login: "apple", avatarUrl: "https://avatars.githubusercontent.com/u/10639145")
    )

    return RepositoryRowView(repository: sampleRepo)
        .padding()
}
