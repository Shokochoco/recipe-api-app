import Foundation

struct RecipeData: Codable {
    let result:[Result]
}

struct Result: Codable {
    let foodImageUrl: String
    let recipeTitle:String
}
