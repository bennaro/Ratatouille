import Foundation
import SwiftData

@Model
class Ingredient {
    var ingredientName: String
    var ingredientDate: Date

    init(ingredientName: String, ingredientDate: Date) {
        self.ingredientName = ingredientName
        self.ingredientDate = ingredientDate
    }
}
