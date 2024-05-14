import SwiftUI
import SwiftData

struct ArchiveView: View {
    
    @Environment(\.modelContext) private var context
    
    @Query private var archiveArea: [Area] = []
    @Query private var archiveCategory: [Category] = []
    @Query private var archiveIngredient: [Ingredient] = []
    @Query private var archiveMeals: [Meal] = []
    
    func deleteArea(_ archiveArea: Area) {
        context.delete(archiveArea)
    }
    func deleteCategory(_ archiveCategory: Category) {
        context.delete(archiveCategory)
    }
    func deleteIngredient(_ archiveIngredient: Ingredient) {
        context.delete(archiveIngredient)
    }
    
    
    var body: some View {
        NavigationStack {
            
            
            Form {
                Section(header: Text("Landområder")) {
                    if (!archiveArea.isEmpty) {
                        List {
                            ForEach(archiveArea) { area in
                                VStack {
                                    HStack {
                                        Text("Landområde:").bold()
                                        Text(area.areaName)
                                        Spacer()
                                    }
                                    HStack {
                                        Text("Arkivert:").bold()
                                        Text(area.areaDate, format: .dateTime.month(.abbreviated).day())
                                            .frame(width: 70, alignment: .leading)
                                        Spacer()
                                    }
                                }
                            }
                            .onDelete { indexes in
                                for index in indexes {
                                    deleteArea(archiveArea[index])
                                }
                            }
                        }
                    } else {
                        Label("Ingen arkiverte landområder", systemImage: "globe")
                    }
                }
                
                Section (header: Text("Kategorier")) {
                    if (!archiveCategory.isEmpty) {
                        List {
                            ForEach(archiveCategory) { category in
                                VStack {
                                    HStack {
                                        Text("Landområde:").bold()
                                        Text(category.categoryName)
                                        Spacer()
                                    }
                                    HStack {
                                        Text("Arkivert:").bold()
                                        Text(category.categoryDate, format: .dateTime.month(.abbreviated).day())
                                            .frame(width: 70, alignment: .leading)
                                        Spacer()
                                    }
                                }
                            }
                            .onDelete { indexes in
                                for index in indexes {
                                    deleteCategory(archiveCategory[index])
                                }
                            }
                        }
                    } else {
                        Label("Ingen arkiverte kategorier", systemImage: "rectangle.3.group.bubble.fill")
                    }
                }
                
                Section (header: Text("Ingredienser")) {
                    if (!archiveIngredient.isEmpty) {
                        List {
                            ForEach(archiveIngredient) { ingredient in
                                VStack {
                                    HStack {
                                        Text("Landområde:").bold()
                                        Text(ingredient.ingredientName)
                                        Spacer()
                                    }
                                    HStack {
                                        Text("Arkivert:").bold()
                                        Text(ingredient.ingredientDate, format: .dateTime.month(.abbreviated).day())
                                            .frame(width: 70, alignment: .leading)
                                        Spacer()
                                    }
                                }
                            }
                            .onDelete { indexes in
                                for index in indexes {
                                    deleteIngredient(archiveIngredient[index])
                                }
                            }
                        }
                    } else {
                        Label("Ingen arkiverte ingredienser", systemImage: "carrot.fill")
                    }
                }
                Section (header: Text("Arkiverte Matoppskrifter")) {
                    if (!archiveMeals.isEmpty) {
                        ArchiveMealCellView()
                    } else {
                        Label("Ingen arkiverte matoppskrifter", systemImage: "takeoutbag.and.cup.and.straw.fill")
                    }
                }
            }
            .navigationTitle("Arkiv")
        }
    }
}

#Preview {
    ArchiveView()
}
