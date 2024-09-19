import SwiftUI

struct LeccionView: View {
    @EnvironmentObject var languageManager: LanguageManager // Importamos el languageManager
    @State private var navigateToAbecedario = false // Estado para navegar a AbecedarioView
    @State private var navigateToFrases = false // Estado para navegar a FrasesView

    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    Image("RioCorriendo")
                        .resizable()
                        .scaledToFill() // Ajusta la imagen para que llene el espacio
                        .frame(maxWidth: .infinity, maxHeight: .infinity) // Se asegura que ocupe todo el espacio
                        .ignoresSafeArea() // Ignora el área segura para llenar toda la pantalla
                    
                    VStack {
                        // Botón Abecedario básico
                        Button(action: {
                            navigateToAbecedario = true // Activa la navegación
                        }) {
                            ZStack {
                                Circle()
                                    .frame(width: 180, height: 180)
                                    .foregroundColor(.green)
                                    .shadow(color: .gray, radius: 10, x: 0, y: 5)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.black, lineWidth: 3)
                                    )
                                
                                Text(languageManager.getLocalizedText(for: "Abecedario"))
                                    .font(.custom("Futura", size: 15))
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        .offset(x: -270, y: -50) // Ajusta esta posición según la imagen
                        .navigationDestination(isPresented: $navigateToAbecedario) {
                            AbecedarioView() // Navega a AbecedarioView
                        }

                        // Botón Frases básicas
                        Button(action: {
                            navigateToFrases = true // Activa la navegación a FrasesView
                        }) {
                            ZStack {
                                Circle()
                                    .frame(width: 180, height: 180)
                                    .foregroundColor(.green)
                                    .shadow(color: .gray, radius: 10, x: 0, y: 5)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.black, lineWidth: 3)
                                    )
                                
                                Text(languageManager.getLocalizedText(for: "Frases"))
                                    .font(.custom("Futura", size: 15))
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        .offset(x: -370, y: 50) // Ajusta esta posición según la imagen
                        .navigationDestination(isPresented: $navigateToFrases) {
                            FrasesView() // Navega a FrasesView
                        }
                        
                        // Botón Sonidos
                        ZStack {
                            Button(action: {
                                print("Botón tocado")
                            }) {
                                Circle()
                                    .frame(width: 180, height: 180)
                                    .foregroundColor(.green)
                                    .shadow(color: .gray, radius: 10, x: 0, y: 5)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.black, lineWidth: 3)
                                    )
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Text(languageManager.getLocalizedText(for: "Sonidos"))
                                .font(.custom("Futura", size: 15))
                                .bold()
                                .foregroundColor(.white)
                        }
                        .offset(x: -240, y: 150) // Ajusta esta posición según la imagen
                        
                        // Botón Sonidos (amarillo)
                        ZStack {
                            Button(action: {
                                print("Botón tocado")
                            }) {
                                Circle()
                                    .frame(width: 180, height: 180)
                                    .foregroundColor(.yellow)
                                    .shadow(color: .gray, radius: 10, x: 0, y: 5)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.black, lineWidth: 3)
                                    )
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Text(languageManager.getLocalizedText(for: "Sonidos"))
                                .font(.custom("Futura", size: 15))
                                .bold()
                                .foregroundColor(.white)
                        }
                        .offset(x: -300, y: 250) // Ajusta esta posición según la imagen
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

#Preview {
    LeccionView()
        .environmentObject(LanguageManager()) // Proporciona el EnvironmentObject aquí
}
