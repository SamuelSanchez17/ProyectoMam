import SwiftUI

struct LeccionView: View {
    var body: some View {
        ScrollView {
            VStack {
                // Imagen de fondo principal
                ZStack {
                    Image("Rio")
                        .resizable()
                        .aspectRatio(contentMode: .fill) // Ajusta la imagen para que rellene el espacio
                        .frame(width: 1200, height: 1200)
                        .clipped() // Recorta cualquier parte que sobresalga del marco

                    VStack {
                        ZStack {
                            Button(action: {
                                // Acción cuando se toca el botón
                                print("Botón tocado")
                            }) {
                                Circle()
                                    .frame(width: 180, height: 180)
                                    .foregroundColor(.green)
                                    .shadow(color: .gray, radius: 10, x: 0, y: 5) // Sombra del círculo
                                    .overlay(
                                        Circle()
                                            .stroke(Color.black, lineWidth: 3) // Contorno negro
                                    )
                            }
                            .buttonStyle(PlainButtonStyle()) // Evita el estilo predeterminado del botón

                            Text("Abecedario básico")
                                .font(.custom("Futura", size: 15))
                                .bold()
                                .foregroundColor(.white) // Color del texto para que contraste con el fondo verde
                        }
                        .offset(x: -400, y: -220)

                        ZStack {
                            Button(action: {
                                // Acción cuando se toca el botón
                                print("Botón tocado")
                            }) {
                                Circle()
                                    .frame(width: 180, height: 180)
                                    .foregroundColor(.green)
                                    .shadow(color: .gray, radius: 10, x: 0, y: 5) // Sombra del círculo
                                    .overlay(
                                        Circle()
                                            .stroke(Color.black, lineWidth: 3) // Contorno negro
                                    )
                            }
                            .buttonStyle(PlainButtonStyle()) // Evita el estilo predeterminado del botón

                            Text("Frases básicas")
                                .font(.custom("Futura", size: 15))
                                .bold()
                                .foregroundColor(.white) // Color del texto para que contraste con el fondo verde
                        }
                        .offset(x: -310, y: -50)

                        ZStack {
                            Button(action: {
                                // Acción cuando se toca el botón
                                print("Botón tocado")
                            }) {
                                Circle()
                                    .frame(width: 180, height: 180)
                                    .foregroundColor(.green)
                                    .shadow(color: .gray, radius: 10, x: 0, y: 5) // Sombra del círculo
                                    .overlay(
                                        Circle()
                                            .stroke(Color.black, lineWidth: 3) // Contorno negro
                                    )
                            }
                            .buttonStyle(PlainButtonStyle()) // Evita el estilo predeterminado del botón

                            Text("Sonidos")
                                .font(.custom("Futura", size: 15))
                                .bold()
                                .foregroundColor(.white) // Color del texto para que contraste con el fondo verde
                        }
                        .offset(x: -85, y: 20)

                        ZStack {
                            Button(action: {
                                // Acción cuando se toca el botón
                                print("Botón tocado")
                            }) {
                                Circle()
                                    .frame(width: 180, height: 180)
                                    .foregroundColor(.yellow)
                                    .shadow(color: .gray, radius: 10, x: 0, y: 5) // Sombra del círculo
                                    .overlay(
                                        Circle()
                                            .stroke(Color.black, lineWidth: 3) // Contorno negro
                                    )
                            }
                            .buttonStyle(PlainButtonStyle()) // Evita el estilo predeterminado del botón

                            Text("Sonidos")
                                .font(.custom("Futura", size: 15))
                                .bold()
                                .foregroundColor(.white) // Color del texto para que contraste con el fondo verde
                        }
                        .offset(x: 250, y: 0)
                    }
                    .frame(maxWidth: .infinity) // Asegura que el VStack llene el ancho disponible
                    
                    HStack(spacing: 20) {
                        // Botón con flecha a la izquierda
                        Button(action: {
                            print("Botón de flecha izquierda presionado")
                            // Acción del botón izquierda
                        }) {
                            Image(systemName: "arrow.left")
                                .resizable()
                                .scaledToFit()
                                .padding(20)
                                .frame(width: 60, height: 60)
                                .background(Color(red: 0.8, green: 0.2, blue: 0.2)) // Color RGB
                                .clipShape(Circle())
                                .foregroundColor(.white)
                        }
                        .offset(x: -550, y: -550) // Ajusta el offset para la flecha izquierda
                        
                    }
                    .padding()
                }
                .background(Color.green) // Asegura que el fondo no oculte contenido
                .edgesIgnoringSafeArea(.all) // Extiende el fondo hasta los bordes de la pantalla

                // Nueva sección con una segunda imagen de fondo y más elementos
                ZStack {
                    Image("NuevaImagen")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 1200, height: 600)
                        .clipped()

                }
                .frame(height: 600) // Altura de la nueva sección para asegurar el desplazamiento
            }
            
            ZStack{
                Image("Rio")
                    .resizable()
                    .aspectRatio(contentMode: .fill) // Ajusta la imagen para que rellene el espacio
                    .frame(width: 1200, height: 1200)
                    .clipped() // Recorta cualquier parte que sobresalga del marco
                    .scaleEffect(x: -1, y: 1, anchor: .center) // Aplica el efecto de espejo
                    .offset(x:0,y:-620)
                
                VStack {
                    // Agrega más elementos aquí
                    Text("Nueva Sección")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()

                    Button(action: {
                        // Acción para el nuevo botón
                        print("Nuevo botón tocado")
                    }) {
                        Circle()
                            .frame(width: 180, height: 180)
                            .foregroundColor(.blue)
                            .shadow(color: .gray, radius: 10, x: 0, y: 5) // Sombra del círculo
                            .overlay(
                                Circle()
                                    .stroke(Color.black, lineWidth: 3) // Contorno negro
                            )
                            .overlay(
                                Text("Nuevo")
                                    .font(.custom("Futura", size: 15))
                                    .bold()
                                    .foregroundColor(.white)
                            )
                    }
                }
                .frame(maxWidth: .infinity) // Asegura que el VStack llene el ancho disponible

            }
        }
        .background(Color.clear) // Asegura que el fondo no oculte contenido
        .edgesIgnoringSafeArea(.all) // Extiende el fondo hasta los bordes de la pantalla
        
        
    }
}

struct LeccionView_Previews: PreviewProvider {
    static var previews: some View {
        LeccionView()
    }
}
