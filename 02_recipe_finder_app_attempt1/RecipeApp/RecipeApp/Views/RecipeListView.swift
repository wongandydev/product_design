import Combine
import SwiftUI

// MARK: - Recipe List View (SwiftUI)

struct RecipeListView: View {

    // MARK: - Properties

    @StateObject private var viewModel = RecipeListViewModel()
    @State private var searchText = ""

    // MARK: - Body

    var body: some View {
        NavigationStack {
            ZStack {
                // Main content
                recipeListContent

                // Loading overlay
                if viewModel.isLoading {
                    loadingView
                }
            }
            .navigationTitle("Recipe Finder")
            .searchable(text: $searchText, prompt: "Search recipes...")
            .onSubmit(of: .search) {
                Task {
                    await viewModel.searchRecipes(query: searchText)
                }
            }
        }
    }

    // MARK: - View Components

    @ViewBuilder
    private var recipeListContent: some View {
        if let errorMessage = viewModel.errorMessage {
            // Error state
            errorView(message: errorMessage)
        } else if viewModel.recipes.isEmpty && !searchText.isEmpty {
            // Empty state (after search)
            emptyStateView
        } else if viewModel.recipes.isEmpty {
            // Initial state
            initialStateView
        } else {
            // Success state - show recipes
            recipeList
        }
    }

    private var recipeList: some View {
        List(viewModel.recipes) { recipe in
            NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                RecipeRowView(recipe: recipe)
            }
        }
        .listStyle(.plain)
    }

    private var loadingView: some View {
        VStack {
            ProgressView("Searching...")
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(10)
                .shadow(radius: 10)
        }
    }

    private var initialStateView: some View {
        ContentUnavailableView(
            "Search for Recipes",
            systemImage: "magnifyingglass",
            description: Text("Enter a recipe name or ingredient to get started")
        )
    }

    private var emptyStateView: some View {
        ContentUnavailableView(
            "No Recipes Found",
            systemImage: "fork.knife.circle",
            description: Text("Try searching for something else")
        )
    }

    private func errorView(message: String) -> some View {
        ContentUnavailableView(
            "Something Went Wrong",
            systemImage: "exclamationmark.triangle",
            description: Text(message)
        )
    }
}

// MARK: - Recipe Row View

struct RecipeRowView: View {
    let recipe: Recipe

    var body: some View {
        HStack(spacing: 12) {
            // Recipe image
            AsyncImage(url: URL(string: recipe.strMealThumb ?? "")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 60, height: 60)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                case .failure:
                    Image(systemName: "photo")
                        .frame(width: 60, height: 60)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                @unknown default:
                    EmptyView()
                }
            }

            // Recipe info
            VStack(alignment: .leading, spacing: 4) {
                Text(recipe.strMeal)
                    .font(.headline)
                    .lineLimit(2)

                if let category = recipe.strCategory {
                    Text(category)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }

            Spacer()
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Recipe List View Model

@MainActor
class RecipeListViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published var recipes: [Recipe] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    // MARK: - Properties

    private let recipeService = RecipeService()

    // MARK: - Methods

    func searchRecipes(query: String) async {
        guard !query.isEmpty else { return }

        isLoading = true
        errorMessage = nil

        do {
            // TODO: Uncomment when RecipeService is implemented
            recipes = try await recipeService.searchRecipes(query: query)
        } catch {
            errorMessage = error.localizedDescription
            recipes = []
        }

        isLoading = false
    }
}

// MARK: - Preview

#Preview {
    RecipeListView()
}

#Preview("With Sample Data") {
    let viewModel = RecipeListViewModel()
    viewModel.recipes = [.sample]

    return NavigationStack {
        List(viewModel.recipes) { recipe in
            RecipeRowView(recipe: recipe)
        }
        .navigationTitle("Recipe Finder")
    }
}
