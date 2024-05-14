import SwiftUI

struct FavoriteDetailView: View {
    var meal: Meal
    @State private var image: UIImage?
    
    var body: some View {
        VStack {
            Form {
                Section {
                    AsyncImage(url: URL(string: meal.strMealThumb)) { image in
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
                
                Section {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Sjanger:")
                                .bold()
                                .padding(.bottom, 4)
                            Text("Opprinnelse:").bold()
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text(meal.strCategory)
                            FavoriteAreaCellView(meal: meal)
                        }
                    }
                }
                
                Section(header: Text("Ingredienser:").bold()) {
                    FavoriteIngredientListCellView(meal: meal)
                }
                
                Section(header: Text("Slik gjør du:").bold()) {
                    Text(meal.strInstructions)
                        .padding(.horizontal)
                }
            }
        }
        .navigationBarTitle(meal.strMeal)
    }
}

#Preview {
    EmptyView()
}
