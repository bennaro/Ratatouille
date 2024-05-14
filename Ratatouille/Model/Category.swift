import Foundation
import SwiftData

@Model
class Category {
    var categoryName: String
    var categoryDate: Date
    
    init(categoryName: String, categoryDate: Date) {
        self.categoryName = categoryName
        self.categoryDate = categoryDate
    }
}
