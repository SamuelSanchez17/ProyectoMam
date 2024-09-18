//
//  GastroView.swift
//  ProyectoMam
//
//  Created by ADMIN UNACH on 10/09/24.
//

import SwiftUI

struct GastroView: View {
    @EnvironmentObject var languageManager: LanguageManager // Importamos el languageManager
    var body: some View {
        ZStack{
            Color(red: 259/255, green: 169/255, blue: 0/255)                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Text(languageManager.getLocalizedText(for:"Aprende más sobre la cultura"))
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
                            Text(languageManager.getLocalizedText(for:"Aprende más sobre la cultura"))//TEXTO ACERCA DE LA GASTRONOMIA 
                                .font(.custom("Futura", size: 50))
                                .bold()
                        )
                    )
                .shadow(color: .black, radius: 10, x: 0, y: 0)
            }.offset(x:0 ,y:-350)// Ajusta los parámetros según tus necesidades
            
            VStack{
                HStack{
                    Text("Texto sobre las tradiciones")
                        .font(.custom("Futura", size: 30))
                        .offset(x:150, y:0)
                    Circle()
                        .frame(width: 300, height: 300)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .overlay(
                                       Circle() // Círculo adicional para el borde
                                           .stroke(Color.black, lineWidth: 10) // Color y grosor del borde
                                   )
                        .offset(x:220 ,y:-150)

                        
                }
            }
                  
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
                .offset(x: -530, y: -350) // Ajusta el offset para la flecha izquierda
                
            }
            .padding()

        }
    }
}
 
#Preview {
    GastroView()
        .environmentObject(LanguageManager()) // Proporciona el EnvironmentObject aquí

}
