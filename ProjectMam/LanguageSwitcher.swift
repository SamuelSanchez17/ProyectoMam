import SwiftUI

struct LanguageSwitcher: View {
    @EnvironmentObject var languageManager: LanguageManager
    
    var body: some View {
        Menu {
            Button(action: {
                withAnimation {
                    languageManager.switchLanguage(to: "en")
                }
            }) {
                HStack {
                    Image(systemName: "globe")
                    Text("English")
                }
            }
            Button(action: {
                withAnimation {
                    languageManager.switchLanguage(to: "es")
                }
            }) {
                HStack {
                    Image(systemName: "globe")
                    Text("Español")
                }
            }
            Button(action: {
                withAnimation {
                    languageManager.switchLanguage(to: "mam")
                }
            }) {
                HStack {
                    Image(systemName: "globe")
                    Text("Mam")
                }
            }
        } label: {
            HStack {
                Image(systemName: "globe")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(.white)
                Text(languageManager.getLocalizedText(for: "IDIOMA"))
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .medium))
                    .fixedSize(horizontal: true, vertical: false) // Evita que el texto se redimensione
                Image(systemName: "chevron.down")
                    .foregroundColor(.white)
                    .font(.system(size: 16))
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .frame(width: 180, height: 45) // Fija el tamaño del botón
            .background(Color(UIColor.darkGray)) // Fondo oscuro
            .cornerRadius(25)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
        }
    }
}
