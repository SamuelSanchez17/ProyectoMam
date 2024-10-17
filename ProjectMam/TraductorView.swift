import SwiftUI

struct TraductorView: View {
    @EnvironmentObject var languageManager: LanguageManager
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State private var sourceLanguage = "es"
    @State private var targetLanguage = "en"
    @State private var inputText = ""
    @State private var translatedText = ""

    var body: some View {
        VStack(spacing: 20) {
            Text(languageManager.getLocalizedText(for: "Traductor"))
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
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image("botonRegreso")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
        }, trailing: LanguageSwitcher())
    }

    private func translateText() {
        TranslationService.shared.translate(inputText, from: sourceLanguage, to: targetLanguage) { translation in
            DispatchQueue.main.async {
                translatedText = translation
            }
        }
    }
}

