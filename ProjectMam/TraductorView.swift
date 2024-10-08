import SwiftUI

struct TraductorView: View {
    @EnvironmentObject var languageManager: LanguageManager
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode> // Control de la navegación

    @State private var sourceLanguage = "es"
    @State private var targetLanguage = "en"
    @State private var inputText = ""
    @State private var translatedText = ""

    var body: some View {
        VStack(spacing: 20) {
            Text(languageManager.getLocalizedText(for: "Traductor")) // Localiza el título
                .font(.largeTitle)

            Picker(languageManager.getLocalizedText(for: "Idioma de origen"), selection: $sourceLanguage) {
                Text(languageManager.getLocalizedText(for: "Español")).tag("es")
                Text(languageManager.getLocalizedText(for: "Inglés")).tag("en")
                Text(languageManager.getLocalizedText(for: "Mam")).tag("mam")
            }
            .pickerStyle(SegmentedPickerStyle())

            Picker(languageManager.getLocalizedText(for: "Idioma de destino"), selection: $targetLanguage) {
                Text(languageManager.getLocalizedText(for: "Español")).tag("es")
                Text(languageManager.getLocalizedText(for: "Inglés")).tag("en")
                Text(languageManager.getLocalizedText(for: "Mam")).tag("mam")
            }
            .pickerStyle(SegmentedPickerStyle())

            TextField(languageManager.getLocalizedText(for: "Ingresa texto aquí"), text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(languageManager.getLocalizedText(for: "Traducir")) {
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
        .navigationBarBackButtonHidden(true) // Oculta el botón <Back predeterminado
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss() // Funcionalidad para regresar a la vista anterior
        }) {
            Image("botonRegreso") // Tu asset personalizado para el botón de retroceso
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
        }, trailing: LanguageSwitcher()) // Agregar el LanguageSwitcher
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
