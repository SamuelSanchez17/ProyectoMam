import Foundation

class TranslationService {
    static let shared = TranslationService()
    private let apiKey = "AIzaSyANQMJS6wdzmokkSE4kz197FxcqXtEOJVI" // API de Google Translate

    private init() {}

    func translate(_ text: String, from sourceLang: String, to targetLang: String, completion: @escaping (String) -> Void) {
        let normalizedText = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? text
        let urlString = "https://translation.googleapis.com/language/translate/v2?q=\(normalizedText)&source=\(sourceLang)&target=\(targetLang)&key=\(apiKey)"

        guard let url = URL(string: urlString) else {
            print("URL inválida.")
            completion(text)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error en la solicitud: \(String(describing: error?.localizedDescription))")
                completion(text)
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let data = json["data"] as? [String: Any],
                   let translations = data["translations"] as? [[String: Any]],
                   let translatedText = translations.first?["translatedText"] as? String {
                    completion(translatedText)
                } else {
                    print("Error en el formato de la respuesta JSON.")
                    completion(text)
                }
            } catch {
                print("Error al parsear el JSON: \(error.localizedDescription)")
                completion(text)
            }
        }

        task.resume()
    }
}

