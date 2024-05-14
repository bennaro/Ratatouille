import SwiftUI
import SwiftData

struct EditAreaView: View {
    @Environment(\.modelContext) var context
    @State private var isShowingItemSheet = false
    @Query private var areas: [Area] = []
    @State private var areaToEdit: Area?
    
    func addToArchive(area: Area) {
        let areaItem = Area(areaName: "", areaDate: .now)
    }
    func delete (area: Area) {
        context.delete(area)
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(areas) { area in
                    AreaCell(area: area)
                        .onTapGesture {
                            areaToEdit = area
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button {
                                delete(area: area)
                            } label: {
                                Label("Trash", systemImage: "trash.fill")
                            }
                            .tint(.red)
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button {
                               addToArchive(area: area)
                            } label: {
                                Label("Archive", systemImage: "archivebox.fill")
                            }
                            .tint(.blue)
                        }
                }
            }
            .navigationTitle("Mine Landområder")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingItemSheet) { 
                AddAreaSheet()
                .presentationDetents([.fraction(0.25)])
                .presentationDragIndicator(.visible)
            }
            .sheet(item: $areaToEdit, content: { area in
                UpdateAreaSheet(area: area)
            })
            
            .toolbar {
                if !areas.isEmpty {
                    Button("Legg til landområde", systemImage: "plus") {
                        isShowingItemSheet = true
                    }
                }
            }
            .overlay {
                if areas.isEmpty {
                    ContentUnavailableView(label: {
                        Label("Ingen Redigerte Landområder", systemImage: "globe")
                            .padding(.vertical)
                    }, actions: {
                        Button("Legg til Landområde") { isShowingItemSheet = true }
                    })
                    .offset(y: -60)
                }
            }
        }
    }
}

#Preview {
    EditAreaView()
}

struct AreaCell: View {
    
    let area: Area
    
    var body: some View {
        VStack {
            HStack {
                Text("Landområde:").bold()
            Text(area.areaName)
            Spacer()
            }
            HStack {
                Text("Lagret:").bold()
            Text(area.areaDate, format: .dateTime.month(.abbreviated).day())
                .frame(width: 70, alignment: .leading)
            Spacer()
            }
        }
    }
}

struct AddAreaSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var context
    
    @State private var areaName: String = ""
    @State private var areaDate: Date = .now
    
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Navn på landområde", text: $areaName)
                DatePicker("Dato", selection: $areaDate, displayedComponents: .date)
                
            }
            .navigationTitle("Nytt landområde")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Avbryt") { dismiss() }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Lagre") {
                        let area = Area(areaName: areaName, areaDate: areaDate)
                        context.insert(area)
                        
                        try! context.save()
                        dismiss()
                    }
                }
                
            }
        }
    }
}

struct UpdateAreaSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var area: Area
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Navn på landområde", text: $area.areaName)
                DatePicker("Dato", selection: $area.areaDate, displayedComponents: .date)
            }
            .navigationTitle("Nytt landområde")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Ferdig") { dismiss() }
                }
                
                
            }
        }
    }
}





