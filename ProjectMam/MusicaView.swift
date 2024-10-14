import SwiftUI

struct MusicaView: View {
    @EnvironmentObject var languageManager: LanguageManager // Importamos el languageManager
    
    var body: some View {
        ZStack {
            Color(red: 20/255, green: 145/255, blue: 255/255)
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
                            Text(languageManager.getLocalizedText(for: "Aprende más sobre la cultura")) // TEXTO ACERCA DE LA CULTURA
                                .font(.custom("Futura", size: 50))
                                .bold()
                        )
                    )
                    .shadow(color: .black, radius: 10, x: 0, y: 0)
            }
            .offset(x: 0, y: -270) // Ajusta los parámetros según tus necesidades
            
            VStack {
                HStack {
                    Text("Texto sobre las tradiciones")
                        .font(.custom("Futura", size: 30))
                        .offset(x: 0, y: 0)
                }
            }
            HStack{
                LanguageSwitcher()
            }.offset(x:490, y:-350)
        }
    }
}


#Preview {
    MusicaView()
        .environmentObject(LanguageManager())
}
