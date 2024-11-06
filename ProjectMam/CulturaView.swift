import SwiftUI

struct CulturaView: View {
    @EnvironmentObject var languageManager: LanguageManager
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    let buttonSize: CGFloat = 170
    let spacing: CGFloat = 10
    let verticalSpacing: CGFloat = 20 // Espaciado vertical

    var buttons: [(imageName: String, text: String, color: Color, action: () -> AnyView)] {
        return [
            (imageName: "Micro", text: languageManager.getLocalizedText(for: "Musica"), color: Color(red: 20/255, green: 145/255, blue: 255/255), action: { AnyView(MusicaView()) }),
            (imageName: "Tenedor", text: languageManager.getLocalizedText(for: "Gastronomia"), color: Color(red: 259/255, green: 169/255, blue: 0/255), action: { AnyView(GastroView()) }),
            (imageName: "Tradiciones", text: languageManager.getLocalizedText(for: "Tradiciones"), color: Color(red: 147/255, green: 0/255, blue: 78/255), action: { AnyView(TradicionesView()) }),
            (imageName: "Leccion", text: languageManager.getLocalizedText(for: "Lección"), color: Color(red: 211/255, green: 0/255, blue: 182/255), action: { AnyView(LeccionView()) }),
            (imageName: "Traductor", text: languageManager.getLocalizedText(for: "Traductor"), color: Color(red: 115/255, green: 0/255, blue: 211/255), action: { AnyView(TraductorView()) }),
            (imageName: "Derechos", text: languageManager.getLocalizedText(for: "Derechos"), color: Color(red: 6/255, green: 182/255, blue: 233/255), action: { AnyView(DerechosView()) })
        ]
    }

    var body: some View {
        ZStack {
            Image("Volcan")
                .resizable()
                .edgesIgnoringSafeArea(.all)

            Text(languageManager.getLocalizedText(for: "Cultura"))
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
                        Text(languageManager.getLocalizedText(for: "Cultura"))
                            .font(.custom("Futura", size: 50))
                            .bold()
                    )
                )
                .shadow(color: .black, radius: 10, x: 0, y: 0)
                .offset(x: 0, y: -330)

            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: spacing), count: 3), spacing: verticalSpacing) {
                ForEach(0..<buttons.count, id: \.self) { index in
                    NavigationLink(destination: buttons[index].action()) {
                        VStack {
                            Image(buttons[index].imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70, height: 70)
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
                    .padding(.vertical, 50)  // Añade padding vertical entre los botones
                }
            }
            .padding()
            .offset(y: 50)  // Ajusta la posición vertical de la cuadrícula si es necesario
            
            // Botón en la esquina superior izquierda
            VStack {
                HStack {
                    NavigationLink(destination: BookView()) {
                        Image("Libro")
                            .resizable()
                            .opacity(0.90)
                            .frame(width: 75, height: 75)
                            .padding()
                    }
                    Spacer()
                }
                Spacer()

                // Botón Language Switcher al fondo
                HStack {
                    LanguageSwitcher()
            
                }.offset(x:495, y:-690)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct CulturaView_Previews: PreviewProvider {
    static var previews: some View {
        CulturaView().environmentObject(LanguageManager())
    }
}
