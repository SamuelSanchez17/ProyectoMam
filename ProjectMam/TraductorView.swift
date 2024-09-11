import SwiftUI

struct TraductorView: View {
    @EnvironmentObject var languageManager: LanguageManager
    @State private var sourceLanguage = "es"
    @State private var targetLanguage = "en"
    @State private var inputText = ""
    @State private var translatedText = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Traductor")
                    .font(.largeTitle)

                Picker("Idioma de origen", selection: $sourceLanguage) {
                    Text("Español").tag("es")
                    Text("Inglés").tag("en")
                    Text("Mam").tag("mam")
                }
                .pickerStyle(SegmentedPickerStyle())

                Picker("Idioma de destino", selection: $targetLanguage) {
                    Text("Español").tag("es")
                    Text("Inglés").tag("en")
                    Text("Mam").tag("mam")
                }
                .pickerStyle(SegmentedPickerStyle())

                TextField("Ingresa texto aquí", text: $inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Traducir") {
                    translateText()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)

                Text(translatedText)
                    .padding()
                    .frame(minHeight: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.blue, lineWidth: 1)
                    )
                
                Spacer()
            }
            .padding()
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Asegura uso completo de la pantalla
    }

    private func translateText() {
        if sourceLanguage == targetLanguage {
            translatedText = inputText
            return
        }

        if sourceLanguage == "mam" || targetLanguage == "mam" {
            // Traducción para el idioma Mam usando JSON
            translatedText = translateFromJSON(inputText)
        } else {
            // Traducción usando el archivo JSON para español e inglés
            translatedText = translateFromJSON(inputText)
        }
    }

    private func translateFromJSON(_ text: String) -> String {
        let translatedText = TranslationService.shared.translate(text, from: sourceLanguage, to: targetLanguage)
        return translatedText
    }
}

// Vista previa para el desarrollo
struct TraductorView_Previews: PreviewProvider {
    static var previews: some View {
        TraductorView()
            .environmentObject(LanguageManager())
    }
}
