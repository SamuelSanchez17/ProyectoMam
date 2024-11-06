import SwiftUI

struct LeccionView: View {
    @EnvironmentObject var languageManager: LanguageManager // Importamos el languageManager
    @State private var navigateToAbecedario = false // Estado para navegar a AbecedarioView
    @State private var navigateToFrases = false // Estado para navegar a FrasesView
    @State private var navigateToPalabras = false // Estado para navegar a PalabrasView

    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    Image("RioCorriendo")
                        .resizable()
                        .scaledToFill() // Ajusta la imagen para llenar todo el espacio
                        .edgesIgnoringSafeArea(.all) // Ignora las áreas seguras
                        .frame(width: 1300, height: 1200) // Asegura que ocupe todo el espacio
                        .clipped() // Recorta cualquier exceso fuera del área visible
                    
                    VStack {
                        // Botón Abecedario básico
                        NavigationLink(destination: AbecedarioView()) {
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

                        // Botón Frases básicas
                        NavigationLink(destination: FrasesView()) {
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
                        NavigationLink(destination: PalabrasView()) {
                            ZStack {
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
                            
                            Text(languageManager.getLocalizedText(for: "Leccion"))
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
        .navigationBarItems(trailing: LanguageSwitcher()) // Agregar el LanguageSwitcher
    }
}

#Preview {
    LeccionView()
        .environmentObject(LanguageManager()) // Proporciona el EnvironmentObject aquí
}
