//
//  Textos.swift
//  ProyectoMam
//
//  Created by ADMIN UNACH on 27/08/24.
//

import SwiftUI

struct Textos: View {
    @State private var selectedSide: String = "Option1" // Estado para controlar la opción seleccionada
    var body: some View {
        ZStack{
            Color(red: 0, green: 168/255, blue: 107/255)
                .edgesIgnoringSafeArea(.all) //
            
            VStack{
                HStack{
                    Button(action: {
                               // Acción del botón
                           }) {
                               Image(systemName: "magnifyingglass") // Nombre del ícono de la lupa en SF Symbols
                                   .font(.system(size: 50)) // Tamaño del ícono
                                   .foregroundColor(.white) // Color del ícono
                                   .offset(x:520, y:-560)
                           }
                    
                    HStack {
                                // Opción 1
                                Button(action: {
                                    selectedSide = "Option1"
                                }) {
                                    Text("Español-Mam")
                                        .font(.system(size: 25))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .background(
                                                                selectedSide == "Option1"
                                                                    ? Color(red: 159/255, green:213/255, blue: 209/255) // Color RGB personalizado
                                                                    : Color(red: 159/255, green:213/255, blue: 209/255).opacity(0.5) // Color RGB personalizado con opacidad
                                                            )
                                        .cornerRadius(15)
                                }
                                
                                // Opción 2
                                Button(action: {
                                    selectedSide = "Option2"
                                }) {
                                    Text("Mam-Español")
                                        .font(.system(size: 25))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .background(
                                                              selectedSide == "Option2"
                                                                  ? Color(red: 159/255, green:213/255, blue: 209/255) // Color RGB personalizado
                                                                  : Color(red: 159/255, green:213/255, blue: 209/255).opacity(0.5) // Color RGB personalizado con opacidad
                                                          )
                                        .cornerRadius(15)
                                }
                            }
                            .frame(width: 450, height: 50) // Tamaño del botón
                            .background(Color.gray.opacity(0.2)) // Color de fondo del contenedor
                            .cornerRadius(15)
                            .offset(x:-20, y:-560)
                    
                    HStack {
                                // Opción 1
                                Button(action: {
                                    selectedSide = "Option1"
                                }) {
                                    Text("A")
                                        .font(.system(size: 25))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .background(
                                                                selectedSide == "Option1"
                                                                    ? Color(red: 159/255, green:213/255, blue: 209/255) // Color RGB personalizado
                                                                    : Color(red: 159/255, green:213/255, blue: 209/255).opacity(0.5) // Color RGB personalizado con opacidad
                                                            )
                                        .cornerRadius(15)
                                }
                                
                                // Opción 2
                                Button(action: {
                                    selectedSide = "Option2"
                                }) {
                                    Text("1")
                                        .font(.system(size: 25))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .background(
                                                              selectedSide == "Option2"
                                                                  ? Color(red: 159/255, green:213/255, blue: 209/255) // Color RGB personalizado
                                                                  : Color(red: 159/255, green:213/255, blue: 209/255).opacity(0.5) // Color RGB personalizado con opacidad
                                                          )
                                        .cornerRadius(15)
                                }
                            }
                            .frame(width: 120, height: 70) // Tamaño del botón
                            .background(Color.gray.opacity(0.2)) // Color de fondo del contenedor
                            .cornerRadius(15)
                            .offset(x:90, y:-560)
                }.offset(x:35, y:90)
                
                    ZStack{
                        Rectangle()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                            Color(red: 159/255, green:213/255, blue: 209/255)
                        HStack{
                            Image(systemName: "book")
                            // Cambia "book.fill" por el ícono que desees
                                .font(.system(size: 70))
                                .offset(x:-180, y: 0)
                            Image(systemName: "book")
                            // Cambia "book.fill" por el ícono que desees
                                .font(.system(size: 70))
                            
                            Image(systemName: "book")
                            // Cambia "book.fill" por el ícono que desees
                                .font(.system(size: 70))
                                .offset(x:180, y: 0)


                        }
                    }.frame(width: 1100, height: 240)
                        .offset(x:0, y:530)
                
                }
            }
        }
    }

#Preview {
    Textos()
}
