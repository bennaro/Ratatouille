import SwiftUI
import SwiftData

struct EditIngredientsView: View {
    @Environment(\.modelContext) var context
    @State private var isShowingItemSheet = false
    @Query private var ingredients: [Ingredient] = []
    @State private var ingredientToEdit: Ingredient?
    
    func addToArchive(ingredient: Ingredient) {
        let ingredientItem = Ingredient(ingredientName: "", ingredientDate: .now)
    }
    func delete (ingredient: Ingredient) {
        context.delete(ingredient)
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(ingredients) { ingredient in
                    IngredientsCell(ingredient: ingredient)
                        .onTapGesture {
                            ingredientToEdit = ingredient
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button {
                                delete(ingredient: ingredient)
                            } label: {
                                Label("Trash", systemImage: "trash.fill")
                            }
                            .tint(.red)
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button {
                               addToArchive(ingredient: ingredient)
                            } label: {
                                Label("Archive", systemImage: "archivebox.fill")
                            }
                            .tint(.blue)
                        }
                }
            }
            .navigationTitle("Mine Ingredienser")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingItemSheet) {
                AddIngredientsSheet()
                .presentationDetents([.fraction(0.25)])
                .presentationDragIndicator(.visible)
            }
            .sheet(item: $ingredientToEdit, content: { ingredient in
                UpdateIngredientsSheet(ingredient: ingredient)
            })
            .toolbar {
                if !ingredients.isEmpty {
                    Button("Legg til Ingrediens", systemImage: "plus") {
                        isShowingItemSheet = true
                    }
                }
            }
            .overlay {
                if ingredients.isEmpty {
                    ContentUnavailableView(label: {
                        Label("Ingen redigerte ingredienser", systemImage: "carrot")
                            .padding(.vertical)
                    }, actions: {
                        Button("Legg til Ingredienser") { isShowingItemSheet = true }
                    })
                    .offset(y: -60)
                }
            }
        }
    }
}

#Preview {
    EditIngredientsView()
}

struct IngredientsCell: View {
    
    let ingredient: Ingredient
    
    var body: some View {
        VStack {
            HStack {
                Text("Ingrediens:").bold()
            Text(ingredient.ingredientName)
            Spacer()
            }
            HStack {
                Text("Lagret:").bold()
            Text(ingredient.ingredientDate, format: .dateTime.month(.abbreviated).day())
                .frame(width: 70, alignment: .leading)
            Spacer()
            }
        }
    }
}

struct AddIngredientsSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var context
    
    @State private var ingredientName: String = ""
    @State private var ingredientDate: Date = .now
    
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Navn på ingrediens", text: $ingredientName)
                DatePicker("Dato", selection: $ingredientDate, displayedComponents: .date)
                
            }
            .navigationTitle("Ny ingrediens")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Avbryt") { dismiss() }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Lagre") {
                        let ingredient = Ingredient(ingredientName: ingredientName, ingredientDate: .now)
                        context.insert(ingredient)
                        
                        try! context.save()
                        dismiss()
                    }
                }
                
            }
        }
    }
}

struct UpdateIngredientsSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var ingredient: Ingredient
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Navn på ingrediens", text: $ingredient.ingredientName)
                DatePicker("Dato", selection: $ingredient.ingredientDate, displayedComponents: .date)
            }
            .navigationTitle("Ny ingrediens")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Ferdig") { dismiss() }
                }
                
                
            }
        }
    }
}

