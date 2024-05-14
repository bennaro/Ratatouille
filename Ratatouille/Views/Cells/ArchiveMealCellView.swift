import SwiftUI
import SwiftData

struct ArchiveMealCellView: View {
    @Environment(\.modelContext) private var context
    @Query private var archiveMeals: [Meal] = []
    
    func deleteItems(_ archiveMeals: Meal) {
        context.delete(archiveMeals)
    }
    
    var body: some View {
        List {
            ForEach(archiveMeals.filter {$0.isArchive}) { meal in
                NavigationLink(destination: FavoriteDetailView(meal: meal)) {
                    HStack {
                        AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .cornerRadius(8)
                        } placeholder: {
                            Image(systemName: "carrot.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .cornerRadius(8)
                                .foregroundColor(.gray)
                        }
                        VStack {
                            HStack {
                                Text(meal.strMeal)
                                    .bold()
                                Spacer()
                            }
                            HStack {
                                Text(meal.strCategory)
                                
                                Text(meal.strArea)
                                
                                Spacer()
                            }
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        }
                    }
                }
            }
            .onDelete { indexes in
                for index in indexes {
                    deleteItems(archiveMeals[index])
                }
            }
        }
    }
}

#Preview {
    ArchiveMealCellView()
}
