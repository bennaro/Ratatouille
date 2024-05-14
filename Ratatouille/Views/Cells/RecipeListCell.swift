import SwiftUI

struct RecipeListCell: View {
    
    let recipe: Recipe
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: recipe.strMealThumb ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .cornerRadius(8)
            } placeholder: {
                Image(systemName: "carrot.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .cornerRadius(8)
                    .foregroundColor(.gray)
            }
            VStack {
                HStack {
                    if let strMeal = recipe.strMeal {
                        Text(strMeal)
                            .bold()
                    }
                    Spacer()
                }
                HStack {
                    if let strCategory = recipe.strCategory {
                        Text(strCategory)
                    }
                    Text("-")
                    AreaCellView(recipe: recipe)
                    Spacer()
                }
                .font(.subheadline)
                .foregroundColor(.gray)
            }
        }
    }
}

//#Preview {
//    RecipeListCell(recipe: Recipe(idMeal: "52771", strMeal: "Spicy Arrabiata Penne", strCategory: "Vegetarian", strArea: "Italian", strMealThumb: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg"))
//}
