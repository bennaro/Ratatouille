import SwiftUI
import SwiftData

enum FilterType: Hashable {
    case area
    case category
    case ingredient
    case name
}

struct RecipeSearchView: View {
    @State private var recipe: [Recipe] = []
    @State private var isSearchSheetPresented = false
    @State private var searchText = ""
    @State private var filter: FilterType = .area
    
    @Environment(\.modelContext) private var context
    @Query private var mealItems: [Meal]
    
    let baseURL = "https://www.themealdb.com/api/json/v1/1/"
    
    func searchRecipes() {
        let urlString: String
        
        switch filter {
        case .area:
            urlString = baseURL + "filter.php?a=\(searchText)"
        case .category:
            urlString = baseURL + "filter.php?c=\(searchText)"
        case .ingredient:
            urlString = baseURL + "filter.php?i=\(searchText)"
        case .name:
            urlString = baseURL + "search.php?s=\(searchText)"
        }
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
                        self.recipe = result.meals
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
    
    var searchNames: String {
        switch filter {
        case .area:
            return "Søk etter landområder"
        case .category:
            return "Søk etter kategori"
        case .ingredient:
            return "Søk etter ingrediens"
        case .name:
            return "Søk etter navn"
        }
    }
    
    func addToFavorite(recipe: Recipe) {
        let mealItem = Meal(recipe: recipe, isFavorite: true, isArchive: false)
        context.insert(mealItem)
    }
    func addToArchive(recipe: Recipe) {
        let mealItem = Meal(recipe: recipe, isFavorite: false, isArchive: true)
        context.insert(mealItem)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Filter", selection: $filter) {
                    Image(systemName: "globe").tag(FilterType.area)
                    
                    Image(systemName: "rectangle.3.group.bubble").tag(FilterType.category)
                    
                    Image(systemName: "carrot").tag(FilterType.ingredient)
                    
                    Image(systemName: "magnifyingglass").tag(FilterType.name)
                }
                .pickerStyle(.segmented)
                .padding()
                
                Form {
                    Section (header: Text("Matoppskrifter")) {
                        List {
                            ForEach(recipe, id: \.idMeal) { recipe in
                                NavigationLink(destination: RecipeDetailView(id: recipe.idMeal)) {
                                    RecipeListCell(recipe: recipe)
                                }
                                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                                    Button {
                                        addToFavorite(recipe: recipe)
                                    } label: {
                                        Label("Favorites", systemImage: "star.fill")
                                    }
                                    .tint(.yellow)
                                }
                                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                    Button {
                                        addToArchive(recipe: recipe)
                                    } label: {
                                        Label("Archive", systemImage: "archivebox.fill")
                                    }
                                    .tint(.blue)
                                }
                            }
                        }
                    }
                }
                .overlay {
                    if recipe.isEmpty {
                        ContentUnavailableView(label: {
                            Label("Ingen matoppskrifter", systemImage: "takeoutbag.and.cup.and.straw.fill")
                                .padding(.vertical)
                        }, description: {
                            Text("Søk etter oppskrifter")
                        })
                        .offset(y: -60)
                    }
                }
                
                .navigationBarTitle(searchNames)
            }
        }
        .onChange(of: filter) {
            if filter == .area || filter == .category || filter == .ingredient || filter == .name {
                isSearchSheetPresented = true
            }
        }
        .sheet(isPresented: $isSearchSheetPresented) {
            NavigationView {
                Form {
                    VStack {
                        TextField("Søk...", text: $searchText, onCommit: {
                            searchRecipes()
                            isSearchSheetPresented = false
                        })
                        .disableAutocorrection(true)
                        .font(.title2)
                    }
                }
                .navigationBarItems(
                    leading: Button(action: {
                        isSearchSheetPresented = false
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                    },
                    trailing: Button(action: {
                        searchRecipes()
                        isSearchSheetPresented = false
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.blue)
                    }
                )
                .navigationBarTitle(searchNames, displayMode: .inline)
            }
            .presentationDetents([.fraction(0.25)])
            .presentationDragIndicator(.visible)
        }
    }
}



#Preview {
    RecipeSearchView()
}


