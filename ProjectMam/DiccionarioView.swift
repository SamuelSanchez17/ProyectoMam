//
//  DiccionarioView.swift
//  ProyectoMam
//
//  Created by ADMIN UNACH on 04/09/24.
//

import SwiftUI

struct DiccionarioView: View {
    @State private var selectedOption: String? = nil
    @State private var selectedOption1: Int = 0 // Estado para la opción seleccionada (0 o 1)

    let options = [
        "Español-Mam",
        "Inglés-Mam",
        "Mam-Español",
        "Mam-Inglés"
    ]
    var body: some View {
        ZStack{
            Color(red: 8/255, green: 203/255, blue: 98/255)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            
            VStack{
                HStack(spacing: 8) {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            // Actualiza la opción seleccionada
                            selectedOption = option
                        }) {
                            Text(option)
                                .font(.title)
                                .padding()
                                .background(
                                    // Cambia el color de fondo según la opción seleccionada
                                    selectedOption == option ? Color(red: 56/255, green: 182/255, blue: 255/255) : Color(red: 169/255, green:   224/255, blue: 255/255)
                                )
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .opacity(selectedOption == option ? 1.0 : 0.5) // Difumina las opciones no seleccionadas
                                .animation(.easeInOut, value: selectedOption) // Animación suave
                        }
                        .buttonStyle(PlainButtonStyle()) // Evita que el botón tenga el estilo predeterminado
                    }
                    Button(action: {
                        // Acción que se ejecuta cuando se presiona el botón
                        print("Lupa presionada")
                    }){
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .offset(x:30, y:0)
                    }
                    
                }.offset(x:0, y:0)
                
                HStack{
                    Button(action: {
                                        selectedOption1 = 0
                                    }) {
                                        Text("A")
                                            .font(.system(size: 34))
                                            .bold()
                                            .padding()
                                            .frame(maxWidth: .infinity) // Expande el botón para ocupar todo el ancho disponible
                                            .background(selectedOption1 == 0 ? Color(red: 56/255, green: 182/255, blue: 255/255) : Color(red: 169/255, green:   224/255, blue: 255/255)) // Cambia el color de fondo
                                            .foregroundColor(.white) // Color del texto
                                            .clipShape(RoundedRectangle(cornerRadius: 10)) // Esquinas redondeadas
                                            .opacity(selectedOption1 == 0 ? 1.0 : 0.5) // Cambia la opacidad
                                            .animation(.easeInOut, value: selectedOption1) // Animación suave
                                            .frame(width: 100, height: 100)
                                    }
                                    
                                    // Botón para la opción 2
                                    Button(action: {
                                        selectedOption1 = 1
                                    }) {
                                        Text("1")
                                            .font(.system(size: 34))
                                            .bold()               .padding()
                                            .frame(maxWidth: .infinity) // Expande el botón para ocupar todo el ancho disponible
                                            .background(selectedOption1 == 1 ? Color(red: 56/255, green: 182/255, blue: 255/255) : Color(red: 169/255, green:   224/255, blue: 255/255)) // Cambia el color de fondo
                                            .foregroundColor(.white) // Color del texto
                                            .clipShape(RoundedRectangle(cornerRadius: 10)) // Esquinas redondeadas
                                            .opacity(selectedOption1 == 1 ? 1.0 : 0.5) // Cambia la opacidad
                                            .animation(.easeInOut, value: selectedOption) // Animación suave
                                            .frame(width:100, height: 100)
                                    }
                                }
            }.offset(x:00, y:-300)
            
            ZStack{
                HStack{
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 450, height: 400)
                        .foregroundColor(Color(red: 12/255, green: 141/255, blue: 255/255))
                        .padding()
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 450, height: 400)
                        .foregroundColor(Color(red: 12/255, green: 141/255, blue: 255/255))
                }.offset(x:0, y:20)
                VStack{
                    HStack{
                        Text("IDIOMA 1")
                            .font(.custom("Futura", size: 40))
                            .foregroundColor(.white)
                            .padding()
                            .offset(x:-120, y:0)
                        
                        Text("IDIOMA 2")
                            .font(.custom("Futura", size: 40))
                            .foregroundColor(.white)
                            .offset(x:130, y:0)


                    }.offset(x:0, y:-120)
                }
            }
        }
    }
}

#Preview {
    DiccionarioView()
}
