//
//  FrasesView.swift
//  ProyectoMam
//
//  Created by ADMIN UNACH on 10/09/24.
//

import SwiftUI

struct FrasesView: View {
    var body: some View {
        
        ZStack {
            Color(red: 8/255, green: 203/255, blue: 98/255)
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                Image("Avatar")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .offset(x:-20,y:-110)

                Image("Dialogo")
                    .resizable()
                    .frame(width: 800, height: 300)
                    .scaleEffect(x: -1, y: 1, anchor: .center) // Aplica el efecto de espejo
                    .offset(x: -90, y: -170)

                Button(action: {
                    // Acción cuando se toca el botón
                    print("Imagen botón tocada")
                }) {
                    Image("Bocina") // Asegúrate de reemplazar "Bocina" con el nombre de tu imagen
                        .resizable()
                        .aspectRatio(contentMode: .fit) // Ajusta la imagen al contenido
                        .frame(width: 80, height: 80) // Ajusta el tamaño según sea necesario
                }
                .buttonStyle(PlainButtonStyle()) // Evita el estilo predeterminado del botón
                .offset(x: -790, y: -160) // Mueve el botón a la posición deseada
            }
            .offset(x: 80, y:-90) // Ajusta la posición del HStack/
            
            
            VStack{
                HStack{
                    
                    Button(action: {
                        print("Botón 1 presionado")
                        // Acción del primer botón
                    }) {
                        VStack {
                            Text("Texto 1")
                                .font(.headline)
                        }
                        .frame(width: 300, height: 120)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                    
                    Button(action: {
                        print("Botón 1 presionado")
                        // Acción del primer botón
                    }) {
                        VStack {
                            Text("Texto 1")
                                .font(.headline)
                        }
                        .frame(width: 300, height: 120)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                    
                    Button(action: {
                        print("Botón 1 presionado")
                        // Acción del primer botón
                    }) {
                        VStack {
                            Text("Texto 1")
                                .font(.headline)
                        }
                        .frame(width: 300, height: 120)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                }
                
                HStack{
                    Button(action: {
                        print("Botón 1 presionado")
                        // Acción del primer botón
                    }) {
                        VStack {
                            Text("Texto 1")
                                .font(.headline)
                        }
                        .frame(width: 300, height: 120)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                    
                    Button(action: {
                        print("Botón 1 presionado")
                        // Acción del primer botón
                    }) {
                        VStack {
                            Text("Texto 1")
                                .font(.headline)
                        }
                        .frame(width: 300, height: 120)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                }
            }.offset(x:0, y:120)
            
            
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
                .offset(x: -500, y: -350) // Ajusta el offset para la flecha izquierda
                
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
    FrasesView()
}
