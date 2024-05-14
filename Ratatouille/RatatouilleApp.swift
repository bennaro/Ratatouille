import SwiftUI
import SwiftData

@main
struct RatatouilleApp: App {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
        .modelContainer(for: [Meal.self, Area.self, Ingredient.self, Category.self])
    }
}
