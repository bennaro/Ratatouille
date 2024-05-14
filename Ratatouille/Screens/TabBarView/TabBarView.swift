import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            FavoritesView()
                .tabItem { Label("Mine oppskrifter", systemImage: "fork.knife.circle.fill") }
            
            RecipeSearchView()
                .tabItem { Label("Søk", systemImage: "magnifyingglass.circle.fill") }
            
            SettingsView()
                .tabItem { Label("Innstillinger", systemImage: "gearshape.fill") }
        }
    }
}

#Preview {
    TabBarView()
}
