import SwiftUI

struct VistaSelector: View {
    @State private var isMenuVisible = false
    @EnvironmentObject var languageManager: LanguageManager

    var body: some View {
        NavigationView {
            ZStack {
                Color.green
                    .edgesIgnoringSafeArea(.all)

                ScrollView {
                    VStack {
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
                            
                            Text(languageManager.getLocalizedText(for: "Historia de la cultura Mam"))
                                .font(.custom("Futura", size: 50))
                                .bold()
                                .foregroundColor(.clear)
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.white, Color.gray]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                    .mask(
                                        Text(languageManager.getLocalizedText(for: "Historia de la cultura Mam"))
                                            .font(.custom("Futura", size: 50))
                                            .bold()
                                    )
                                )
                                .shadow(color: .black, radius: 10, x: 0, y: 5)
                                .offset(x: 0, y: -50)

                            // Cuadro deslizante para "Historia Mam"
                            VStack {
                                ScrollView {
                                    Text(languageManager.getLocalizedText(for: "Historia Mam"))
                                        .padding()
                                        .frame(maxWidth: .infinity) // Asegura que el texto ocupe todo el ancho
                                    .font(.custom("Futura", size: 25))
                                }

    
                            }
                            .background(Color.white) // Color de fondo del cuadro
                            .cornerRadius(15) // Bordes redondeados
                            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5) // Sombra
                            .padding() // Espaciado alrededor del cuadro
                            .frame(width: 800, height: 600) // Altura máxima del cuadro
                            .offset(x:0,y:-50)
                            

                            Spacer().frame(height: 20) // Espaciador de iconos
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.green)

                        Spacer()
                        
                        // Parte inferior con los botones
                        HStack {
                            NavigationLink(destination: LeccionView()) { // Botón 1
                                Image(systemName: "desktopcomputer")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 60)
                                    .padding()
                                    .background(Color.blue)
                                    .clipShape(Circle())
                                    .foregroundColor(.white)
                                    .navigationBarBackButtonHidden(true)
                            }
                            .navigationBarBackButtonHidden(true)
                            Spacer().frame(width: 150)
                            
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
                            .navigationBarBackButtonHidden(true)
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
                    .navigationBarBackButtonHidden(true)
                }
                
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
                            
                            Spacer().frame(height: 40)
                            
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
                .offset(x: isMenuVisible ? 0 : -250)
                .animation(.easeInOut(duration: 0.3), value: isMenuVisible)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    VistaSelector()
        .environmentObject(LanguageManager())
}
