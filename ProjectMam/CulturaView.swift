import SwiftUI

struct CulturaView: View {
    @EnvironmentObject var languageManager: LanguageManager // Importamos el languageManager
    let buttonSize: CGFloat = 170
    let spacing: CGFloat = 10 // Espacio adicional entre los botones
    let imageScale: CGFloat = 0.38 // Factor de escala para las imágenes
    
    // Definición de botones usando closures para acceder al texto localizado
    var buttons: [(imageName: String, text: String, color: Color, action: () -> Void)] {
        return [
            (imageName: "Micro", text: languageManager.getLocalizedText(for: "Musica"), color: Color(red: 20/255, green: 145/255, blue: 255/255), action: { print("Botón 1 presionado") }),
            (imageName: "Dress", text: languageManager.getLocalizedText(for: "Vestimenta"), color: Color(red: 12/255, green: 193/255, blue: 62/255), action: { print("Botón 2 presionado") }),
            (imageName: "Casa", text: languageManager.getLocalizedText(for: "Arquitectura"), color: Color(red: 190/255, green: 0/255, blue: 0/255), action: { print("Botón 3 presionado") }),
            (imageName: "Fork", text: languageManager.getLocalizedText(for: "Gastronomia"), color: Color(red: 259/255, green: 169/255, blue: 0/255), action: { print("Botón 4 presionado") }),
            (imageName: "Trad", text: languageManager.getLocalizedText(for: "Tradiciones"), color: Color(red: 147/255, green: 0/255, blue: 78/255), action: { print("Botón 5 presionado") }),
            (imageName: "Tic", text: languageManager.getLocalizedText(for: "Juegos"), color: Color(red: 243/255, green: 42/255, blue: 2/255), action: { print("Botón 6 presionado") })
        ]
    }
    
    @State private var isMenuVisible = false
    
    var body: some View {
        ZStack {
            Image("Volcan")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            Text("Aprende más sobre la cultura")
                .font(.custom("Futura", size: 50))
                .bold()
                .foregroundColor(.clear)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.white, Color.gray]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .mask(
                        Text("Aprende más sobre la cultura")
                            .font(.custom("Futura", size: 50))
                            .bold()
                    )
                )
                .shadow(color: .black, radius: 10, x: 0, y: 0)
                .offset(x: 0, y: -330)
            
            GeometryReader { geometry in
                let radius = min(geometry.size.width, geometry.size.height) / 4
                let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
                let adjustedRadius = radius + buttonSize / 2 + spacing

                ZStack {
                    ForEach(0..<buttons.count, id: \.self) { index in
                        let angle = 2 * .pi / Double(buttons.count) * Double(index)
                        let x = center.x + adjustedRadius * CGFloat(cos(angle))
                        let y = center.y + adjustedRadius * CGFloat(sin(angle))
                        
                        Button(action: buttons[index].action) {
                            VStack {
                                Image(buttons[index].imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: buttonSize * imageScale, height: buttonSize * imageScale)
                                Text(buttons[index].text)
                                    .font(.system(size: 24))
                                    .bold()
                            }
                            .frame(width: buttonSize, height: buttonSize)
                            .background(buttons[index].color)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.4), radius: 10, x: 0, y: 10)
                            .overlay(
                                Circle()
                                    .stroke(Color.white.opacity(0.5), lineWidth: 4)
                            )
                        }
                        .position(x: x, y: y)
                    }
                }
                .offset(x:0, y:50)
            }
            .padding()
        }
    }
}

#Preview {
    CulturaView()
        .environmentObject(LanguageManager()) // Asegúrate de inyectar el LanguageManager
}
