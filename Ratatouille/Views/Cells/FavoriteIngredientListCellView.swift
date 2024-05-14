import SwiftUI

struct FavoriteIngredientListCellView: View {
    
    let meal: Meal
    
    var body: some View {
        VStack {
            
            HStack {
                    Text(meal.strMeasure1)
                    Text(meal.strIngredient1).bold()
                Spacer()
            }
            HStack {
                    Text(meal.strMeasure2)
                    Text(meal.strIngredient2).bold()
                Spacer()
            }
            HStack {
                    Text(meal.strMeasure3)
                    Text(meal.strIngredient3).bold()
                Spacer()
            }
            HStack {
                    Text(meal.strMeasure4)
                    Text(meal.strIngredient4).bold()
                Spacer()
            }
            HStack {
                    Text(meal.strMeasure5)
                    Text(meal.strIngredient5).bold()
                Spacer()
            }
            HStack {
                    Text(meal.strMeasure6)
                    Text(meal.strIngredient6).bold()
                Spacer()
            }
            HStack {
                    Text(meal.strMeasure7)
                    Text(meal.strIngredient7).bold()
                Spacer()
            }
            HStack {
                    Text(meal.strMeasure8)
                    Text(meal.strIngredient8).bold()
                Spacer()
            }
            HStack {
                    Text(meal.strMeasure9)
                    Text(meal.strIngredient9).bold()
                Spacer()
            }
            HStack {
                    Text(meal.strMeasure10)
                    Text(meal.strIngredient10).bold()
                Spacer()
            }
            HStack {
                    Text(meal.strMeasure11)
                    Text(meal.strIngredient11).bold()
                Spacer()
            }
            HStack {
                    Text(meal.strMeasure12)
                    Text(meal.strIngredient12).bold()
                Spacer()
            }
            HStack {
                    Text(meal.strMeasure13)
                    Text(meal.strIngredient13).bold()
                Spacer()
            }
            HStack {
                    Text(meal.strMeasure14)
                    Text(meal.strIngredient14).bold()
                Spacer()
            }
            HStack {
                    Text(meal.strMeasure15)
                    Text(meal.strIngredient15).bold()
                Spacer()
            }
            HStack {
                    Text(meal.strMeasure16)
                    Text(meal.strIngredient16).bold()
                Spacer()
            }
            HStack {
                    Text(meal.strMeasure17)
                    Text(meal.strIngredient17).bold()
                Spacer()
            }
            HStack {
                    Text(meal.strMeasure18)
                    Text(meal.strIngredient18).bold()
                Spacer()
            }
            HStack {
                    Text(meal.strMeasure19)
                    Text(meal.strIngredient19).bold()
                Spacer()
            }
            HStack {
                    Text(meal.strMeasure20)
                    Text(meal.strIngredient20).bold()
                Spacer()
            }
            
            
            
            
            
            
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    EmptyView()
}
