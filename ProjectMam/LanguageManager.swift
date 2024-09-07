import SwiftUI

class LanguageManager: ObservableObject {
    @Published var selectedLanguage: String = Locale.current.languageCode ?? "es"
    private var translations: [String: String] = [:]

    init() {
        loadLanguage(languageCode: selectedLanguage)
    }
    
    func loadLanguage(languageCode: String) {
        guard let path = Bundle.main.path(forResource: languageCode, ofType: "json") else {
            print("No se encontró el archivo de traducción para \(languageCode)")
            return
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            if let dictionary = json as? [String: String] {
                self.translations = dictionary
            }
        } catch {
            print("Error cargando las traducciones para \(languageCode): \(error)")
        }
    }
    
    func getLocalizedText(for key: String) -> String {
        return translations[key] ?? key
    }
    
    func switchLanguage(to languageCode: String) {
        selectedLanguage = languageCode
        loadLanguage(languageCode: languageCode)
    }
}

