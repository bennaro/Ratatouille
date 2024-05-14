import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Environment(\.modelContext) private var context
    @State private var recipe: [Recipe] = []
    
    @Query private var favoriteMeals: [Meal] = []
    
    func addToArchive(recipe: Recipe) {
        let mealItem = Meal(recipe: recipe, isFavorite: false, isArchive: true)
        context.insert(mealItem)
    }
    
    var body: some View {
        NavigationView {
            List {
                FavoriteCellView()
            }
            .overlay {
                if favoriteMeals.isEmpty {
                    ContentUnavailableView(label: {
                        Label("Ingen Matoppskrifter", systemImage: "square.3.layers.3d.slash")
                    }, description: {
                        Text("Søk etter oppskrifter og legg til i favoritter")
                    })
                    .offset(y: -60)
                }
            }
            .navigationTitle("Ratatouille")
        }
    }
}

#Preview {
    FavoritesView()
}
