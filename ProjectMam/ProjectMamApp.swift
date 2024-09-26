import SwiftUI

@main
struct ProjectMamApp: App {
    
    @StateObject private var languageManager = LanguageManager()
    
    var body: some Scene {
        WindowGroup {
            InicioView() // Cambia ContentView() por InicioView()
                .environmentObject(languageManager) // Pasamos el LanguageManager a toda la app
        }
    }
}
