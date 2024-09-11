import SwiftUI

struct VistaSelector: View {
    @State private var isMenuVisible = false
    @EnvironmentObject var languageManager: LanguageManager // Importamos el languageManager

    var body: some View {
        NavigationView {
            ZStack {
                // Contenido principal
                VStack {
                    // Parte superior con el título y la imagen representativa
                    VStack {
                        HStack {
                            Button(action: {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    isMenuVisible.toggle()
                                }
                            }) {
                                Image(systemName: "line.horizontal.3")
                                    .resizable()
                                    .frame(width: 45, height: 40)
                                    .padding()
                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }
                        
                        Text("Conocer más acerca de la cultura")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.top, 20)
                        
                        Spacer().frame(height: 20)
                        
                        Text("Texto acerca de la cultura")
                            .font(.body)
                            .foregroundColor(.black)
                        
                        Spacer().frame(height: 20) // Espaciador de iconos
                        
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 120, height: 120)
                            .overlay(
                                Text("Imagen representativa de la cultura")
                                    .foregroundColor(.white)
                                    .font(.caption)
                                    .multilineTextAlignment(.center)
                                    .padding()
                            )
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    
                    Spacer()
                    
                    // Parte inferior con los botones
                    HStack {
                        NavigationLink(destination: CulturaView()) { // Botón 1
                            Image(systemName: "desktopcomputer")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                                .padding()
                                .background(Color.blue)
                                .clipShape(Circle())
                                .foregroundColor(.white)
                        }
                        
                        Spacer().frame(width: 150) // Espaciador de iconos
                        
                        NavigationLink(destination: TraductorView()) { // Botón 2
                            Image(systemName: "book")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                                .padding()
                                .background(Color.blue)
                                .clipShape(Circle())
                                .foregroundColor(.white)
                        }
                        
                        Spacer().frame(width: 150)
                        
                        NavigationLink(destination: CulturaView()) { // Botón 3
                            Image(systemName: "paintpalette")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                                .padding()
                                .background(Color.blue)
                                .clipShape(Circle())
                                .foregroundColor(.white)
                        }
                        
                    }
                    .padding()
                    .background(Color.blue.opacity(0.8))
                    .cornerRadius(35)
                    .padding(.bottom, 40)
                }
                .edgesIgnoringSafeArea(.all)
                .background(Color.green)
                .navigationBarBackButtonHidden(true) // Esconde el botón "< Back"
                
                // Menú deslizable
                HStack {
                    if isMenuVisible {
                        VStack(alignment: .leading) {
                            Button(action: {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    isMenuVisible.toggle()
                                }
                            }) {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding(.top, 20)
                                    .padding(.leading, 20)
                                    .foregroundColor(.white)
                            }
                            
                            Spacer().frame(height: 40) // Espaciador entre el botón de cierre y las opciones
                            
                            NavigationLink(destination: InicioView()) { // Opción del menú 1
                                Text("Idioma")
                                    .foregroundColor(.white)
                                    .padding(.top, 20)
                            }
                            
                            NavigationLink(destination: InicioView()) { // Opción del menú 2
                                Text("Opción 2")
                                    .foregroundColor(.white)
                                    .padding(.top, 20)
                            }
                            
                            NavigationLink(destination: InicioView()) { // Opción del menú 3
                                Text("Opción 3")
                                    .foregroundColor(.white)
                                    .padding(.top, 20)
                            }
                            
                            Spacer()
                        }
                        .padding()
                        .frame(width: 250)
                        .background(Color.gray)
                        .transition(.move(edge: .leading))
                    }
                    
                    Spacer()
                }
                .offset(x: isMenuVisible ? 0 : -250) // Deslizar desde la izquierda
                .animation(.easeInOut(duration: 0.3), value: isMenuVisible) // Aplicando animación suave
            }
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Esto forzará la vista tipo stack (sin sidebar)
    }
}

#Preview {
    VistaSelector()
}
