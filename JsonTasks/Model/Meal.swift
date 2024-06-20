import Foundation

// MARK: - Meals
struct Meals: Codable {
    let meals: [Meal]
}

// MARK: - Meal
struct Meal: Codable {
    let idMeal: String?
    let strMeal: String?
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strMealThumb: String?
    let strTags: String?
    let strYoutube: String?
}
