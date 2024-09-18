import SwiftUI

struct AbecedarioView: View {
    @EnvironmentObject var languageManager: LanguageManager // Importamos el languageManager
    var body: some View {
        ZStack {
            Color(red: 8/255, green: 203/255, blue: 98/255)
                .edgesIgnoringSafeArea(.all)

            HStack {
                Image("Avatar")
                    .resizable()
                    .frame(width: 300, height: 300)

                Image("Dialogo")
                    .resizable()
                    .frame(width: 700, height: 400)
                    .scaleEffect(x: -1, y: 1, anchor: .center) // Aplica el efecto de espejo
                    .offset(x: -70, y: -170)

                Button(action: {
                    // Acción cuando se toca el botón
                    print("Imagen botón tocada")
                }) {
                    Image("Bocina") // Asegúrate de reemplazar "Bocina" con el nombre de tu imagen
                        .resizable()
                        .aspectRatio(contentMode: .fit) // Ajusta la imagen al contenido
                        .frame(width: 100, height: 100) // Ajusta el tamaño según sea necesario
                }
                .buttonStyle(PlainButtonStyle()) // Evita el estilo predeterminado del botón
                .offset(x: -650, y: -155) // Mueve el botón a la posición deseada
            }
            .offset(x: 80, y:0) // Ajusta la posición del HStack
            
            HStack(spacing: 20) {
                        

                            // Botón con flecha a la derecha
                            Button(action: {
                                print("Botón de flecha derecha presionado")
                                // Acción del botón derecha
                            }) {
                                Image(systemName: "arrow.right")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(20)
                                    .frame(width: 60, height: 60)
                                    .background(Color(red: 0.2, green: 0.6, blue: 0.8)) // Color RGB
                                    .clipShape(Circle())
                                    .foregroundColor(.white)
                            }
                            .offset(x: 500, y: 350) // Ajusta el offset para la flecha derecha
                        }
                        .padding()
        }
    }
}

#Preview {
    AbecedarioView()
}
