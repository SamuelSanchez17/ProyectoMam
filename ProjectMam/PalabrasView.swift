import SwiftUI

struct PalabrasView: View {
    @EnvironmentObject var languageManager: LanguageManager // Importamos el languageManager
    var body: some View {
        ZStack {
            Color(red: 8/255, green: 203/255, blue: 98/255)
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                Image("Dialogo")
                    .resizable()
                    .frame(width: 800, height: 250)
                    .scaleEffect(x: -1, y: 1, anchor: .center) // Aplica el efecto de espejo
                    .offset(x: 10, y: -150)
                
                Button(action: {
                    // Acción cuando se toca el botón
                    print("Imagen botón tocada")
                }) {
                    Image("Bocina") // Asegúrate de reemplazar "Bocina" con el nombre de tu imagen
                        .resizable()
                        .aspectRatio(contentMode: .fit) // Ajusta la imagen al contenido
                        .frame(width: 50, height: 50) // Ajusta el tamaño según sea necesario
                }
                .buttonStyle(PlainButtonStyle()) // Evita el estilo predeterminado del botón
                .offset(x: -680, y: -140) // Mueve el botón a la posición deseada
            }
            .offset(x: 0, y: -130) // Ajusta la posición del HStack
            
            VStack {
                HStack {
                    Button(action: {
                        print("Botón 1 presionado")
                        // Acción del primer botón
                    }) {
                        VStack {
                            Image(systemName: "star")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            Text("Texto 1")
                                .font(.headline)
                        }
                        .frame(width: 250, height: 250)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                    
                    Button(action: {
                        print("Botón 2 presionado")
                        // Acción del segundo botón
                    }) {
                        VStack {
                            Image(systemName: "heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            Text("Texto 2")
                                .font(.headline)
                        }
                        .frame(width: 250, height: 250)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                HStack {
                    Button(action: {
                        print("Botón 3 presionado")
                        // Acción del tercer botón
                    }) {
                        VStack {
                            Image(systemName: "cloud")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            Text("Texto 3")
                                .font(.headline)
                        }
                        .frame(width: 250, height: 250)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                    
                    Button(action: {
                        print("Botón 4 presionado")
                        // Acción del cuarto botón
                    }) {
                        VStack {
                            Image(systemName: "moon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            Text("Texto 4")
                                .font(.headline)
                        }
                        .frame(width: 250, height: 250)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .offset(x: 0, y: 120)
            
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
    PalabrasView()
        .environmentObject(LanguageManager()) // Proporciona el EnvironmentObject aquí
}
