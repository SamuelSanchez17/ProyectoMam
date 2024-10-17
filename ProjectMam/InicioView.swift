import SwiftUI

struct InicioView: View {
    @EnvironmentObject var languageManager: LanguageManager // Importamos el languageManager
    @State private var hasFinishedReading: Bool = UserDefaults.standard.bool(forKey: "hasFinishedReading")
    
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
                    
                    NavigationLink(destination: BookView().navigationBarBackButtonHidden(true)) { // Asegúrate de ocultar el botón de retroceso aquí
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
                
                // Aquí movemos el botón del `LanguageSwitcher` un poco más arriba
                VStack {
                    HStack {
                        Spacer()
                        LanguageSwitcher() // Llamamos a LanguageSwitcher
                            .padding(.trailing, 20) // Ajustamos margen derecho
                            .padding(.top, 10) // Reducimos el margen superior a 10 para moverlo hacia arriba (antes era 60)
                    }
                    Spacer() // Deja espacio para el resto del contenido
                }
            }
            .navigationBarHidden(true) // Ocultamos la barra de navegación predeterminada
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Mantenemos estilo para que no use sidebar
    }
}

#Preview {
    InicioView()
        .environmentObject(LanguageManager()) // Añadimos el environmentObject
}
