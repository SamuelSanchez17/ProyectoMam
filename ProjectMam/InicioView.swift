import SwiftUI

struct InicioView: View {
    @EnvironmentObject var languageManager: LanguageManager // Importamos el languageManager
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("Ruinas")
                    .resizable()
                    .scaledToFill() // Para que la imagen se ajuste sin deformarse
                    .ignoresSafeArea() // Imagen a pantalla completa
                
                VStack {
                    Spacer() // Añade espacio arriba
                    
                    Text(languageManager.getLocalizedText(for: "MamLingua"))
                        .font(.custom("Futura", size: 80))
                        .bold()
                        .foregroundColor(.clear)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.white, Color.gray]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                            .mask(
                                Text(languageManager.getLocalizedText(for: "MamLingua"))
                                    .font(.custom("Futura", size: 80))
                                    .bold()
                            )
                        )
                        .shadow(color: .black, radius: 10, x: 0, y: 5)
                        .padding(.bottom, 280)
                    
                    Text(languageManager.getLocalizedText(for: "Bienvenido"))
                        .font(.custom("Futura", size: 50))
                        .bold()
                        .foregroundColor(.white)
                        .padding(.bottom, 30)
                    
                    NavigationLink(destination: VistaSelector().navigationBarBackButtonHidden(true)) { // Asegúrate de ocultar el botón de retroceso aquí
                        Text(languageManager.getLocalizedText(for: "COMENZAR"))
                            .bold()
                            .font(.custom("Futura", size: 35))
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color(red: 56/255, green: 182/255, blue: 255/255), Color(red: 34/255, green: 153/255, blue: 255/255)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                    .cornerRadius(13)
                            )
                            .shadow(color: Color.blue.opacity(0.5), radius: 15, x: 0, y: 10)
                            .frame(width: 300, height: 60)
                    }
                    
                    Spacer() // Añade espacio debajo
                }
                .padding(.bottom, 50)
            }
            .navigationBarItems(trailing:
                Menu {
                    Button(action: {
                        languageManager.switchLanguage(to: "en") // Cambiar a inglés
                    }) {
                        HStack {
                            Text("English")
                            Image(systemName: "globe") // Ícono del sistema "globe"
                        }
                    }
                    Button(action: {
                        languageManager.switchLanguage(to: "es") // Cambiar a español
                    }) {
                        HStack {
                            Text("Español")
                            Image(systemName: "globe") // Ícono del sistema "globe"
                        }
                    }
                    Button(action: {
                        languageManager.switchLanguage(to: "mam") // Cambiar a Mam
                    }) {
                        HStack {
                            Text("Mam")
                            Image(systemName: "globe") // Ícono del sistema "globe"
                        }
                    }
                } label: {
                    HStack {
                        Text(languageManager.getLocalizedText(for: "IDIOMA"))
                        Image(systemName: "globe") // Ícono del sistema "globe"
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
                    .shadow(color: Color.blue.opacity(0.5), radius: 5, x: 0, y: 5)
                }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Esto forzará la vista tipo stack (sin sidebar)
    }
}

#Preview {
    InicioView()
        .environmentObject(LanguageManager()) // Añadimos el environmentObject
}
