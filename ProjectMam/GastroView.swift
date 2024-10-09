import SwiftUI

struct GastroView: View {
    @EnvironmentObject var languageManager: LanguageManager
    @Environment(\.presentationMode) var presentationMode // Para manejar la acción de regresar manualmente

    var body: some View {
        ZStack {
            Color(red: 255/255, green: 169/255, blue: 0/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(languageManager.getLocalizedText(for: "Aprende más sobre la cultura"))
                    .font(.custom("Futura", size: 50))
                    .bold()
                    .foregroundColor(.clear) // Hacemos el color del texto transparente para que se vea el degradado
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.white, Color.gray]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .mask(
                            Text(languageManager.getLocalizedText(for: "Aprende más sobre la cultura"))
                                .font(.custom("Futura", size: 50))
                                .bold()
                        )
                    )
                    .shadow(color: .black, radius: 10, x: 0, y: 0)
            }
            .offset(x: 0, y: -350) // Ajusta los parámetros según tus necesidades
            
            VStack {
                HStack {
                    Text("Texto sobre las tradiciones")
                        .font(.custom("Futura", size: 30))
                        .offset(x: 150, y: 0)
                    
                    Circle()
                        .frame(width: 300, height: 300)
                        .foregroundColor(.blue)
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 10)
                        )
                        .offset(x: 220, y: -150)
                }
            }
            
            VStack {
                // Botón de regreso personalizado
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss() // Acción para regresar
                    }) {
                        Image("botonRegreso") // Usa tu imagen personalizada "botonRegreso"
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50) // Tamaño del botón
                    }
                    .padding(.leading, 27) // Mueve el botón hacia la izquierda
                    .padding(.top, -46) // Mueve el botón hacia arriba
                    Spacer()
                }
                Spacer() // Empuja todo hacia la parte superior
            }
        }
        .navigationBarBackButtonHidden(true) // Ocultar el botón "<Back" predeterminado
        .navigationBarItems(trailing: LanguageSwitcher()) // Agregar el LanguageSwitcher
    }
}

#Preview {
    GastroView()
        .environmentObject(LanguageManager())
}
