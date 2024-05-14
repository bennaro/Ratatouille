import SwiftUI

struct IngredientListCellView: View {
    
    let recipe: Recipe
    
    var body: some View {
        VStack {
            HStack {
                if let measure1 = recipe.strMeasure1, !measure1.isEmpty {
                    Text(measure1)
                }
                if let ingredient1 = recipe.strIngredient1, !ingredient1.isEmpty {
                    Text(ingredient1).bold()
                }
                Spacer()
            }
            
            HStack {
                if let measure2 = recipe.strMeasure2, !measure2.isEmpty {
                    Text(measure2)
                }
                if let ingredient2 = recipe.strIngredient2, !ingredient2.isEmpty {
                    Text(ingredient2).bold()
                }
                Spacer()
            }
            
            HStack {
                if let measure3 = recipe.strMeasure3, !measure3.isEmpty {
                    Text(measure3)
                }
                if let ingredient3 = recipe.strIngredient3, !ingredient3.isEmpty {
                    Text(ingredient3).bold()
                }
                Spacer()
            }
            
            HStack {
                if let measure4 = recipe.strMeasure4, !measure4.isEmpty {
                    Text(measure4)
                }
                if let ingredient4 = recipe.strIngredient4, !ingredient4.isEmpty {
                    Text(ingredient4).bold()
                }
                Spacer()
            }
            
            HStack {
                if let measure5 = recipe.strMeasure5, !measure5.isEmpty {
                    Text(measure5)
                }
                if let ingredient5 = recipe.strIngredient5, !ingredient5.isEmpty {
                    Text(ingredient5).bold()
                }
                Spacer()
            }
            
            HStack {
                if let measure6 = recipe.strMeasure6, !measure6.isEmpty {
                    Text(measure6)
                }
                if let ingredient6 = recipe.strIngredient6, !ingredient6.isEmpty {
                    Text(ingredient6).bold()
                }
                Spacer()
            }
            
            HStack {
                if let measure7 = recipe.strMeasure7, !measure7.isEmpty {
                    Text(measure7)
                }
                if let ingredient7 = recipe.strIngredient7, !ingredient7.isEmpty {
                    Text(ingredient7).bold()
                }
                Spacer()
            }
            
            HStack {
                if let measure8 = recipe.strMeasure8, !measure8.isEmpty {
                    Text(measure8)
                }
                if let ingredient8 = recipe.strIngredient8, !ingredient8.isEmpty {
                    Text(ingredient8).bold()
                }
                Spacer()
            }
            
            HStack {
                if let measure9 = recipe.strMeasure9, !measure9.isEmpty {
                    Text(measure9)
                }
                if let ingredient9 = recipe.strIngredient9, !ingredient9.isEmpty {
                    Text(ingredient9).bold()
                }
                Spacer()
            }
            
            HStack {
                if let measure10 = recipe.strMeasure10, !measure10.isEmpty {
                    Text(measure10)
                }
                if let ingredient10 = recipe.strIngredient10, !ingredient10.isEmpty {
                    Text(ingredient10).bold()
                }
                Spacer()
            }
            
            HStack {
                if let measure11 = recipe.strMeasure11, !measure11.isEmpty {
                    Text(measure11)
                }
                if let ingredient11 = recipe.strIngredient11, !ingredient11.isEmpty {
                    Text(ingredient11).bold()
                }
                Spacer()
            }
            
            HStack {
                if let measure12 = recipe.strMeasure12, !measure12.isEmpty {
                    Text(measure12)
                }
                if let ingredient12 = recipe.strIngredient12, !ingredient12.isEmpty {
                    Text(ingredient12).bold()
                }
                Spacer()
            }
            
            HStack {
                if let measure13 = recipe.strMeasure13, !measure13.isEmpty {
                    Text(measure13)
                }
                if let ingredient13 = recipe.strIngredient13, !ingredient13.isEmpty {
                    Text(ingredient13).bold()
                }
                Spacer()
            }
            
            HStack {
                if let measure14 = recipe.strMeasure14, !measure14.isEmpty {
                    Text(measure14)
                }
                if let ingredient14 = recipe.strIngredient14, !ingredient14.isEmpty {
                    Text(ingredient14).bold()
                }
                Spacer()
            }
            
            HStack {
                if let measure15 = recipe.strMeasure15, !measure15.isEmpty {
                    Text(measure15)
                }
                if let ingredient15 = recipe.strIngredient15, !ingredient15.isEmpty {
                    Text(ingredient15).bold()
                }
                Spacer()
            }
            
            HStack {
                if let measure16 = recipe.strMeasure16, !measure16.isEmpty {
                    Text(measure16)
                }
                if let ingredient16 = recipe.strIngredient16, !ingredient16.isEmpty {
                    Text(ingredient16).bold()
                }
                Spacer()
            }
            
            HStack {
                if let measure17 = recipe.strMeasure17, !measure17.isEmpty {
                    Text(measure17)
                }
                if let ingredient17 = recipe.strIngredient17, !ingredient17.isEmpty {
                    Text(ingredient17).bold()
                }
                Spacer()
            }
            
            HStack {
                if let measure18 = recipe.strMeasure18, !measure18.isEmpty {
                    Text(measure18)
                }
                if let ingredient18 = recipe.strIngredient18, !ingredient18.isEmpty {
                    Text(ingredient18).bold()
                }
                Spacer()
            }
            
            HStack {
                if let measure19 = recipe.strMeasure19, !measure19.isEmpty {
                    Text(measure19)
                }
                if let ingredient19 = recipe.strIngredient19, !ingredient19.isEmpty {
                    Text(ingredient19).bold()
                }
                Spacer()
            }
            
            HStack {
                if let measure20 = recipe.strMeasure20, !measure20.isEmpty {
                    Text(measure20)
                }
                if let ingredient20 = recipe.strIngredient20, !ingredient20.isEmpty {
                    Text(ingredient20).bold()
                }

                Spacer()
            }
        }
        .padding(.horizontal)
    }
}

//#Preview {
//    IngredientListCellView(recipe: Recipe(
//        idMeal: "1", strIngredient1: "penne rigate",
//        strIngredient2: "olive oil",
//        strIngredient3: "garlic",
//        strIngredient4: "chopped tomatoes",
//        strIngredient5: "red chile flakes",
//        strIngredient6: "italian seasoning",
//        strIngredient7: "basil",
//        strIngredient8: "Parmigiano-Reggiano",
//        strIngredient9: "penne rigate",
//        strIngredient10:"olive oil",
//        strIngredient11:"garlic",
//        strIngredient12:"chopped tomatoes",
//        strIngredient13:"red chile flakes",
//        strIngredient14:"italian seasoning",
//        strIngredient15:"basil",
//        strIngredient16:"Parmigiano-Reggiano",
//        strIngredient17: "red chile flakes",
//        strIngredient18: "italian seasoning",
//        strIngredient19: "basil",
//        strIngredient20: "Parmigiano-Reggiano",
//        strMeasure1: "1 pound",
//        strMeasure2: "1/4 cup",
//        strMeasure3: "3 cloves",
//        strMeasure4: "1 tin ",
//        strMeasure5: "1/2 teaspoon",
//        strMeasure6: "1/2 teaspoon",
//        strMeasure7: "6 leaves",
//        strMeasure8: "spinkling",
//        strMeasure9: "1 pound",
//        strMeasure10:"1/4 cup",
//        strMeasure11:"3 cloves",
//        strMeasure12:"1 tin ",
//        strMeasure13:"1/2 teaspoon",
//        strMeasure14:"1/2 teaspoon",
//        strMeasure15:"6 leaves",
//        strMeasure16:"spinkling",
//        strMeasure17: "1/2 teaspoon",
//        strMeasure18: "1/2 teaspoon",
//        strMeasure19: "6 leaves",
//        strMeasure20: "spinkling"
//    ))
//}
