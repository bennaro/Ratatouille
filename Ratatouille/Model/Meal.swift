import Foundation
import SwiftData

@Model
class Meal {
    var strMeal: String
    var idMeal: String
    var strCategory: String
    var strArea : String
    var strMealThumb: String
    var strInstructions: String
    
    var strIngredient1: String
    var strIngredient2: String
    var strIngredient3: String
    var strIngredient4: String
    var strIngredient5: String
    var strIngredient6: String
    var strIngredient7: String
    var strIngredient8: String
    var strIngredient9: String
    var strIngredient10: String
    var strIngredient11: String
    var strIngredient12: String
    var strIngredient13: String
    var strIngredient14: String
    var strIngredient15: String
    var strIngredient16: String
    var strIngredient17: String
    var strIngredient18: String
    var strIngredient19: String
    var strIngredient20: String
    var strMeasure1: String
    var strMeasure2: String
    var strMeasure3: String
    var strMeasure4: String
    var strMeasure5: String
    var strMeasure6: String
    var strMeasure7: String
    var strMeasure8: String
    var strMeasure9: String
    var strMeasure10: String
    var strMeasure11: String
    var strMeasure12: String
    var strMeasure13: String
    var strMeasure14: String
    var strMeasure15: String
    var strMeasure16: String
    var strMeasure17: String
    var strMeasure18: String
    var strMeasure19: String
    var strMeasure20: String
    
    var isFavorite: Bool
    var isArchive: Bool
    
    init(recipe: Recipe, isFavorite: Bool, isArchive: Bool) {
        self.strMeal = recipe.strMeal ?? ""
        self.idMeal = recipe.idMeal
        self.strCategory = recipe.strCategory ?? ""
        self.strArea = recipe.strArea ?? ""
        self.strMealThumb = recipe.strMealThumb ?? ""
        self.isFavorite = isFavorite
        self.isArchive = isArchive
        self.strInstructions = recipe.strInstructions ?? ""
        self.strIngredient1 = recipe.strIngredient1 ?? ""
        self.strIngredient2 = recipe.strIngredient2 ?? ""
        self.strIngredient3 = recipe.strIngredient3 ?? ""
        self.strIngredient4 = recipe.strIngredient4 ?? ""
        self.strIngredient5 = recipe.strIngredient5 ?? ""
        self.strIngredient6 = recipe.strIngredient6 ?? ""
        self.strIngredient7 = recipe.strIngredient7 ?? ""
        self.strIngredient8 = recipe.strIngredient8 ?? ""
        self.strIngredient9 = recipe.strIngredient9 ?? ""
        self.strIngredient10 = recipe.strIngredient10 ?? ""
        self.strIngredient11 = recipe.strIngredient11 ?? ""
        self.strIngredient12 = recipe.strIngredient12 ?? ""
        self.strIngredient13 = recipe.strIngredient13 ?? ""
        self.strIngredient14 = recipe.strIngredient14 ?? ""
        self.strIngredient15 = recipe.strIngredient15 ?? ""
        self.strIngredient16 = recipe.strIngredient16 ?? ""
        self.strIngredient17 = recipe.strIngredient17 ?? ""
        self.strIngredient18 = recipe.strIngredient18 ?? ""
        self.strIngredient19 = recipe.strIngredient19 ?? ""
        self.strIngredient20 = recipe.strIngredient20 ?? ""
        self.strMeasure1 = recipe.strMeasure1 ?? ""
        self.strMeasure2 = recipe.strMeasure2 ?? ""
        self.strMeasure3 = recipe.strMeasure3 ?? ""
        self.strMeasure4 = recipe.strMeasure4 ?? ""
        self.strMeasure5 = recipe.strMeasure5 ?? ""
        self.strMeasure6 = recipe.strMeasure6 ?? ""
        self.strMeasure7 = recipe.strMeasure7 ?? ""
        self.strMeasure8 = recipe.strMeasure8 ?? ""
        self.strMeasure9 = recipe.strMeasure9 ?? ""
        self.strMeasure10 = recipe.strMeasure10 ?? ""
        self.strMeasure11 = recipe.strMeasure11 ?? ""
        self.strMeasure12 = recipe.strMeasure12 ?? ""
        self.strMeasure13 = recipe.strMeasure13 ?? ""
        self.strMeasure14 = recipe.strMeasure14 ?? ""
        self.strMeasure15 = recipe.strMeasure15 ?? ""
        self.strMeasure16 = recipe.strMeasure16 ?? ""
        self.strMeasure17 = recipe.strMeasure17 ?? ""
        self.strMeasure18 = recipe.strMeasure18 ?? ""
        self.strMeasure19 = recipe.strMeasure19 ?? ""
        self.strMeasure20 = recipe.strMeasure20 ?? ""
    }
}
