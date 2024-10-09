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
                    Text("English")
                    Image("Mundo")
                }
            }
            Button(action: {
                withAnimation {
                    languageManager.switchLanguage(to: "es")
                }
            }) {
                HStack {
                    Text("Español")
                    Image("Mundo")
                }
            }
            Button(action: {
                withAnimation {
                    languageManager.switchLanguage(to: "mam")
                }
            }) {
                HStack {
                    Text("Mam")
                    Image("Mundo")
                }
            }
        } label: {
            HStack {
                Text(languageManager.getLocalizedText(for: "IDIOMA"))
                Image("Mundo")
                    .resizable()
                    .frame(width: 25, height: 25)
            }
            .foregroundColor(.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20)
            .shadow(color: Color.blue.opacity(0.5), radius: 5, x: 0, y: 5)
            .offset(x:0, y:0)
        }
    }
}
