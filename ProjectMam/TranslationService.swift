import Foundation

struct TranslationData: Codable {
    let es: [String: String]
    let en: [String: String]
    let mam: [String: String]
}

class TranslationService {
    static let shared = TranslationService()
    private var translations: TranslationData?

    private init() {
        loadTranslations()
    }

    private func loadTranslations() {
        guard let url = Bundle.main.url(forResource: "translations", withExtension: "json") else {
            print("No se pudo encontrar el archivo JSON en el bundle.")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            translations = try JSONDecoder().decode(TranslationData.self, from: data)
            print("Traducciones cargadas correctamente desde \(url)")
        } catch {
            print("Error al leer el archivo JSON: \(error.localizedDescription)")
        }
    }

    
    /*SAMU
    func translate(_ text: String, from sourceLang: String, to targetLang: String) -> String {
        guard let translations = translations else { return text }
        let normalizedText = text.lowercased()
        
        // Obtener el diccionario del idioma fuente y destino, normalizando claves
        let sourceDictionary = normalizeDictionary(dictionary: translations.dictionary(for: sourceLang))
        let targetDictionary = normalizeDictionary(dictionary: translations.dictionary(for: targetLang))

        // Buscar la palabra en el diccionario del idioma fuente
        guard let intermediateKey = sourceDictionary[normalizedText] else {
            print("No se encontró '\(normalizedText)' en el diccionario de '\(sourceLang)'")
            return text // Devuelve el texto original si no se encuentra la palabra
        }

        // Buscar la palabra traducida en el diccionario del idioma destino
        guard let finalTranslation = targetDictionary[intermediateKey] else {
            print("No se encontró la traducción de '\(intermediateKey)' en '\(targetLang)'")
            return intermediateKey
        }
        
        return finalTranslation
    }
    SAMU*/
    ////////////LUISIN/////////////////////
    
    func translate(_ text: String, from sourceLang: String, to targetLang: String) -> String {
        guard let translations = translations else { return text }
        let normalizedText = text.lowercased().split(separator: " ").map { String($0) }
        
        // Obtener el diccionario del idioma fuente y destino, normalizando claves
        let sourceDictionary = normalizeDictionary(dictionary: translations.dictionary(for: sourceLang))
        let targetDictionary = normalizeDictionary(dictionary: translations.dictionary(for: targetLang))

        var translatedWords = [String]()
        
        // Buscar la palabra en el diccionario del idioma fuente
        for word in normalizedText{
            guard let intermediateKey = sourceDictionary[word] else {
                print("No se encontró '\(word)' en el diccionario de '\(sourceLang)'")
                return text // Devuelve el texto original si no se encuentra la palabra
            }
            guard let finalWordTranslation = targetDictionary[intermediateKey] else {
                    print("No se encontró la traducción de '\(intermediateKey)' en '\(targetLang)'")
                    return intermediateKey
            }
            translatedWords.append(finalWordTranslation)
        }
        
        return translatedWords.joined(separator: " ")
        // Buscar la palabra traducida en el diccionario del idioma destino
        
        
        
    }
    
    ////////////LUISIN/////////////////////


    private func normalizeDictionary(dictionary: [String: String]) -> [String: String] {
        var normalizedDictionary = [String: String]()
        dictionary.forEach { key, value in
            normalizedDictionary[key.lowercased()] = value.lowercased()
        }
        return normalizedDictionary
    }
}

extension TranslationData {
    func dictionary(for language: String) -> [String: String] {
        switch language {
        case "es": return es
        case "en": return en
        case "mam": return mam
        default: return [:]
        }
    }
}
