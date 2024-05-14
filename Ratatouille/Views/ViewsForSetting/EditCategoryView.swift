import SwiftUI
import SwiftData

struct EditCategoryView: View {
    @Environment(\.modelContext) var context
    @State private var isShowingItemSheet = false
    @Query private var categories: [Category] = []
    @State private var categoryToEdit: Category?
    
    func addToArchive(category: Category) {
        let categoryItem = Category(categoryName: "", categoryDate: .now)
    }
    func delete (category: Category) {
        context.delete(category)
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(categories) { category in
                    CategoryCell(category: category)
                        .onTapGesture {
                            categoryToEdit = category
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button {
                                delete(category: category)
                            } label: {
                                Label("Trash", systemImage: "trash.fill")
                            }
                            .tint(.red)
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button {
                               addToArchive(category: category)
                            } label: {
                                Label("Archive", systemImage: "archivebox.fill")
                            }
                            .tint(.blue)
                        }
                }
            }
            .navigationTitle("Mine Kategorier")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingItemSheet) {
                AddCategorySheet()
                .presentationDetents([.fraction(0.25)])
                .presentationDragIndicator(.visible)
            }
            .sheet(item: $categoryToEdit, content: { category in
                UpdateCategorySheet(category: category)
            })
            .toolbar {
                if !categories.isEmpty {
                    Button("Legg til kategori", systemImage: "plus") {
                        isShowingItemSheet = true
                    }
                }
            }
            .overlay {
                if categories.isEmpty {
                    ContentUnavailableView(label: {
                        Label("Ingen Redigerte Kategorier", systemImage: "rectangle.3.group.bubble")
                            .padding(.vertical)
                    }, actions: {
                        Button("Legg til Katogorier") { isShowingItemSheet = true }
                    })
                    .offset(y: -60)
                }
            }
        }
    }
}

#Preview {
    EditCategoryView()
}

struct CategoryCell: View {
    
    let category: Category
    
    var body: some View {
        VStack {
            HStack {
                Text("Kategori:").bold()
            Text(category.categoryName)
            Spacer()
            }
            HStack {
                Text("Lagret:").bold()
            Text(category.categoryDate, format: .dateTime.month(.abbreviated).day())
                .frame(width: 70, alignment: .leading)
            Spacer()
            }
        }
    }
}

struct AddCategorySheet: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var context
    
    @State private var categoryName: String = ""
    @State private var categoryDate: Date = .now
    
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Navn på kategori", text: $categoryName)
                DatePicker("Dato", selection: $categoryDate, displayedComponents: .date)
                
            }
            .navigationTitle("Ny kategori")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Avbryt") { dismiss() }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Lagre") {
                        let category = Category(categoryName: categoryName, categoryDate: .now)
                        context.insert(category)
                        
                        try! context.save()
                        dismiss()
                    }
                }
                
            }
        }
    }
}

struct UpdateCategorySheet: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var category: Category
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Navn på Kategori", text: $category.categoryName)
                DatePicker("Dato", selection: $category.categoryDate, displayedComponents: .date)
            }
            .navigationTitle("Ny kategori")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Ferdig") { dismiss() }
                }
                
                
            }
        }
    }
}
