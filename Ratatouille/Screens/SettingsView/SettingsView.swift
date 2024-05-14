import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Redigere")) {
                    NavigationLink(destination: EditAreaView()) {
                        Label("Redigere landområder", systemImage: "globe")
                    }
                    NavigationLink(destination: EditCategoryView()) {
                        Label("Redigere kategorier", systemImage: "rectangle.3.group.bubble.fill")
                    }
                    NavigationLink(destination: EditIngredientsView()) {
                        Label("Redigere ingredienser", systemImage: "globe")
                    }
                }
                
                Section(header: Text("Mørk modus")) {
                    Toggle(isOn: $isDarkMode) {
                            Label("Aktivere mørk modus", systemImage: "moon.fill")
                    }
                    .onChange(of: isDarkMode) { newValue in
                        UIApplication.shared.windows.first?.rootViewController?.view.overrideUserInterfaceStyle = newValue ? .dark : .light
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color.accentColor))
                }
                
                Section(header: Text("Administrere")) {
                    NavigationLink(destination: ArchiveView()) {
                        Label("Administrere arkiv", systemImage: "archivebox.fill")
                    }
                }
            }
            .navigationTitle("Innstillinger")
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    SettingsView()
}


