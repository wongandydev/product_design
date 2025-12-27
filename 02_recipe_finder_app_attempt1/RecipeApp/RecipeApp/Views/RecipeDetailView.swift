import SwiftUI

// MARK: - Recipe Detail View (SwiftUI)

struct RecipeDetailView: View {

    // MARK: - Properties

    let recipe: Recipe

    // MARK: - Body

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Recipe image
                recipeImageView

                // Recipe info
                VStack(alignment: .leading, spacing: 12) {
                    // Title
                    Text(recipe.strMeal)
                        .font(.title)
                        .fontWeight(.bold)

                    // Metadata
                    HStack {
                        if let category = recipe.strCategory {
                            Label(category, systemImage: "tag")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }

                        if let area = recipe.strArea {
                            Label(area, systemImage: "globe")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }

                    Divider()

                    // Ingredients section
                    ingredientsSection

                    Divider()

                    // Instructions section
                    instructionsSection
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - View Components

    private var recipeImageView: some View {
        AsyncImage(url: URL(string: recipe.strMealThumb ?? "")) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(height: 250)
                    .frame(maxWidth: .infinity)
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipped()
            case .failure:
                Image(systemName: "photo")
                    .font(.largeTitle)
                    .frame(height: 250)
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
            @unknown default:
                EmptyView()
            }
        }
    }

    private var ingredientsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Ingredients")
                .font(.title2)
                .fontWeight(.semibold)

            // TODO: Parse ingredients from recipe model
            // You need to implement the ingredients computed property in Recipe model
            // For now, showing placeholder
            VStack(alignment: .leading, spacing: 8) {
                 ForEach(recipe.ingredients, id: \.name) { ingredient in
                     HStack {
                         Image(systemName: "checkmark.circle")
                             .foregroundColor(.green)
                         Text(ingredient.displayText)
                     }
                 }
            }
        }
    }

    private var instructionsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Instructions")
                .font(.title2)
                .fontWeight(.semibold)

            if let instructions = recipe.strInstructions {
                Text(instructions)
                    .font(.body)
                    .lineSpacing(4)
            } else {
                Text("No instructions available")
                    .foregroundColor(.secondary)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        RecipeDetailView(recipe: .sample)
    }
}
