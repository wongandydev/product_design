import Foundation

// MARK: - Recipe API Response Models

/// Root response object from TheMealDB API
struct RecipeResponse: Codable {
    let meals: [Recipe]?
}

/// Recipe model matching TheMealDB API structure
struct Recipe: Codable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strMealThumb: String?
    let strTags: String?
    let strYoutube: String?

    // Ingredients 1-20 (API provides up to 20 ingredient slots)
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?

    // Measures 1-20 (corresponding to ingredients above)
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?

    // Identifiable conformance
    var id: String { idMeal }

    /// Computed property that combines ingredients and measures into a clean array
    /// Filters out nil and empty values from the API response
    var ingredients: [Ingredient] {
        let pairs: [(String?, String?)] = [
            (strIngredient1, strMeasure1),
            (strIngredient2, strMeasure2),
            (strIngredient3, strMeasure3),
            (strIngredient4, strMeasure4),
            (strIngredient5, strMeasure5),
            (strIngredient6, strMeasure6),
            (strIngredient7, strMeasure7),
            (strIngredient8, strMeasure8),
            (strIngredient9, strMeasure9),
            (strIngredient10, strMeasure10),
            (strIngredient11, strMeasure11),
            (strIngredient12, strMeasure12),
            (strIngredient13, strMeasure13),
            (strIngredient14, strMeasure14),
            (strIngredient15, strMeasure15),
            (strIngredient16, strMeasure16),
            (strIngredient17, strMeasure17),
            (strIngredient18, strMeasure18),
            (strIngredient19, strMeasure19),
            (strIngredient20, strMeasure20)
        ]

        return pairs.compactMap { ingredient, measure in
            // Filter out nil or empty ingredient names
            guard let ingredient = ingredient,
                  !ingredient.trimmingCharacters(in: .whitespaces).isEmpty else {
                return nil
            }

            let measureText = measure?.trimmingCharacters(in: .whitespaces) ?? ""
            return Ingredient(name: ingredient, measure: measureText)
        }
    }
}

// MARK: - Helper Models

/// Optional: Create a cleaner ingredient model
struct Ingredient: Identifiable {
    var id: ObjectIdentifier {
        return name
    }
    
    let name: String
    let measure: String

    var displayText: String {
        "\(measure) \(name)"
    }
}

// MARK: - Sample Data for Testing

extension Recipe {
    /// Sample recipe for SwiftUI previews and testing
    static let sample = Recipe(
        idMeal: "52940",
        strMeal: "Brown Stew Chicken",
        strCategory: "Chicken",
        strArea: "Jamaican",
        strInstructions: "Squeeze lime over chicken and rub well. Drain off excess lime juice. Combine tomato, scallion, onion, garlic, pepper, thyme, pimento and soy sauce and add to chicken. Season with salt and pepper and marinate for at least one hour.",
        strMealThumb: "https://www.themealdb.com/images/media/meals/sypxpx1515365095.jpg",
        strTags: "Stew",
        strYoutube: "https://www.youtube.com/watch?v=1234",
        strIngredient1: "Chicken",
        strIngredient2: "Tomato",
        strIngredient3: "Onion",
        strIngredient4: "Garlic",
        strIngredient5: nil,
        strIngredient6: nil,
        strIngredient7: nil,
        strIngredient8: nil,
        strIngredient9: nil,
        strIngredient10: nil,
        strIngredient11: nil,
        strIngredient12: nil,
        strIngredient13: nil,
        strIngredient14: nil,
        strIngredient15: nil,
        strIngredient16: nil,
        strIngredient17: nil,
        strIngredient18: nil,
        strIngredient19: nil,
        strIngredient20: nil,
        strMeasure1: "1 whole",
        strMeasure2: "2 chopped",
        strMeasure3: "1 sliced",
        strMeasure4: "2 cloves",
        strMeasure5: nil,
        strMeasure6: nil,
        strMeasure7: nil,
        strMeasure8: nil,
        strMeasure9: nil,
        strMeasure10: nil,
        strMeasure11: nil,
        strMeasure12: nil,
        strMeasure13: nil,
        strMeasure14: nil,
        strMeasure15: nil,
        strMeasure16: nil,
        strMeasure17: nil,
        strMeasure18: nil,
        strMeasure19: nil,
        strMeasure20: nil
    )
}
