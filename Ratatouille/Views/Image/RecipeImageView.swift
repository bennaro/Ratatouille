import SwiftUI

struct RecipeImageView: View {
    let recipe: Recipe
    var body: some View {
        AsyncImage(url: URL(string: recipe.strMealThumb ?? "")) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:330 ,height: 200)
                .cornerRadius(5)
        } placeholder: {
            Image(systemName: "carrot.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150)
                .cornerRadius(8)
                .foregroundColor(.gray)
                .padding(.leading, 80)
        }
    }
}
