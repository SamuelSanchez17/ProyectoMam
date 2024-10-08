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
            (imageName: "Dress", text: languageManager.getLocalizedText(for: "Vestimenta"), color: Color(red: 12/255, green: 193/255, blue: 62/255), action: { AnyView(VestimentaView()) }),
            (imageName: "Casa", text: languageManager.getLocalizedText(for: "Arquitectura"), color: Color(red: 190/255, green: 0/255, blue: 0/255), action: { AnyView(ArquitecturaView()) }),
            (imageName: "Fork", text: languageManager.getLocalizedText(for: "Gastronomia"), color: Color(red: 259/255, green: 169/255, blue: 0/255), action: { AnyView(GastroView()) }),
            (imageName: "Trad", text: languageManager.getLocalizedText(for: "Tradiciones"), color: Color(red: 147/255, green: 0/255, blue: 78/255), action: { AnyView(TradicionesView()) }),
            (imageName: "Tic", text: languageManager.getLocalizedText(for: "Juegos"), color: Color(red: 243/255, green: 42/255, blue: 2/255), action: { AnyView(JuegosView()) }),
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
                }
            }
            .padding()
            .offset(y: 50) // Ajusta la posición vertical de la cuadrícula si es necesario
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image("botonRegreso")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
        }, trailing: LanguageSwitcher()) // Aquí se agrega el LanguageSwitcher
    }
}

struct CulturaView_Previews: PreviewProvider {
    static var previews: some View {
        CulturaView().environmentObject(LanguageManager())
    }
}
