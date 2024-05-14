import SwiftUI
import SwiftData

struct RecipeDetailView: View {
    @State private var recipe: Recipe?
    
    private let id: String
    
    init(id: String) {
        self.id = id
    }
    
    func fetchRecipe() {
        let urlString = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
        print("Constructed URL: \(url)")
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(SearchResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.recipe = result.meals.first
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
    
    
    
    
    var body: some View {
        
        // Search by meal using ID
            // "https://someurl/\(id)"
        
        VStack {
            Form {
                if let recipe {
                    RecipeImageView(recipe: recipe)
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
                            if let recipe = recipe,
                               let category = recipe.strCategory, !category.isEmpty {
                                Text(category)
                            }
                            if let recipe {
                                AreaCellView(recipe: recipe)
                            }
                        }
                    }
                }
                
                Section(header: Text("Ingredienser:").bold()) {
                    if let recipe = recipe {
                        IngredientListCellView(recipe: recipe)
                    }
                }
                
                Section(header: Text("Slik gjør du:").bold()) {
                    if let recipe,
                       let instructions = recipe.strInstructions, !instructions.isEmpty {
                        Text(instructions)
                            .padding(.horizontal)
                    }
                }
            }
        }
        .navigationBarTitle(recipe?.strMeal ?? "")
        .onAppear {
            fetchRecipe()
        }
    }
}



#Preview {
    RecipeDetailView(id: "123456")
}



