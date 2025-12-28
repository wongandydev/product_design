import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = RepositorySearchViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                // Search Input Section
                HStack {
                    TextField("Enter repository name...", text: $viewModel.searchText)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled()

                    Button("Search") {
                        Task {
                            await viewModel.search()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(viewModel.searchText.isEmpty || viewModel.isLoading)
                }
                .padding(.horizontal)

                // Content Section
                if viewModel.isLoading {
                    Spacer()
                    ProgressView("Searching...")
                    Spacer()
                } else if let error = viewModel.errorMessage {
                    Spacer()
                    VStack(spacing: 8) {
                        Image(systemName: "exclamationmark.triangle")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                        Text(error)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    Spacer()
                } else {
                    RepositoryListView(repositories: viewModel.repositories)
                }
            }
            .navigationTitle("GitHub Search")
        }
    }
}

#Preview {
    SearchView()
}
