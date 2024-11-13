    import SwiftUI

    struct CulturaView: View {
        @EnvironmentObject var languageManager: LanguageManager
        @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
        var body: some View {
            NavigationStack{
                ZStack {
                    Image("Volcan")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                    
                    Text(languageManager.getLocalizedText(for: "Cultura"))
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
                                Text(languageManager.getLocalizedText(for: "Cultura"))
                                    .font(.custom("Futura", size: 50))
                                    .bold()
                            )
                        )
                        .shadow(color: .black, radius: 10, x: 0, y: 0)
                        .offset(x: 0, y: -330)
                    
                    VStack {
                        HStack(spacing: 20) {
                            // Primer botón - Música
                            NavigationLink(destination: MusicaView()) {
                                VStack {
                                    Image("Micro")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding(.bottom, 5)
                                        .offset(x: -10)
                                    
                                    Text(languageManager.getLocalizedText(for: "Musica"))
                                        .font(.custom("Futura", size: 35))
                                        .foregroundColor(.white)
                                        .offset(x: -5)
                                }
                                .padding()
                                .frame(width: 230, height: 230)  // Tamaño del botón
                                .background(Circle().fill(Color(red: 20/255, green: 145/255, blue: 255/255)))
                                .overlay(Circle().stroke(Color.black, lineWidth: 3)) // Borde negro
                            }
                            
                            // Segundo botón - Gastronomía
                            NavigationLink(destination: GastroView()) {
                                VStack {
                                    Image("Tenedor")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding(.bottom, 5)
                                    
                                    Text(languageManager.getLocalizedText(for: "Gastronomia"))
                                        .font(.custom("Futura", size: 30))
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .frame(width: 230, height: 230)  // Tamaño del botón
                                .background(Circle().fill(Color(red: 259/255, green: 169/255, blue: 0/255)))
                                .overlay(Circle().stroke(Color.black, lineWidth: 3)) // Borde negro
                            }
                            
                            // Tercer botón - Tradiciones
                            NavigationLink(destination: TradicionesView()) {
                                VStack {
                                    Image("Tradiciones")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding(.bottom, 5)
                                    
                                    Text(languageManager.getLocalizedText(for: "Tradiciones"))
                                        .font(.custom("Futura", size: 33))
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .frame(width: 230, height: 230)  // Tamaño del botón
                                .background(Circle().fill(Color(red: 147/255, green: 0/255, blue: 78/255)))
                                .overlay(Circle().stroke(Color.black, lineWidth: 3)) // Borde negro
                            }
                        }.padding()
                        
                        HStack(spacing: 20) {
                            // Primer botón - Traductor
                            NavigationLink(destination: TraductorView()) {
                                VStack {
                                    Image("Traductor")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding(.bottom, 5)
                                        .offset(x: -10)
                                    
                                    Text(languageManager.getLocalizedText(for: "Traductor"))
                                        .font(.custom("Futura", size: 32))
                                        .foregroundColor(.white)
                                        .offset(x: -5)
                                }
                                .padding()
                                .frame(width: 230, height: 230)  // Tamaño del botón
                                .background(Circle().fill(Color(red: 115/255, green: 0/255, blue: 211/255)))
                                .overlay(Circle().stroke(Color.black, lineWidth: 3)) // Borde negro
                            }
                            
                            // Segundo botón - Lección
                            NavigationLink(destination: LeccionView()) {
                                VStack {
                                    Image("Leccion")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding(.bottom, 5)
                                    
                                    Text(languageManager.getLocalizedText(for: "Lección"))
                                        .font(.custom("Futura", size: 35))
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .frame(width: 230, height: 230)  // Tamaño del botón
                                .background(Circle().fill(Color(red: 211/255, green: 0/255, blue: 182/255)))
                                .overlay(Circle().stroke(Color.black, lineWidth: 3)) // Borde negro
                            }
                            
                            // Tercer botón - Derechos
                            NavigationLink(destination: DerechosView()) {
                                VStack {
                                    Image("Derechos")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding(.bottom, 5)
                                    
                                    Text(languageManager.getLocalizedText(for: "Derechos"))
                                        .font(.custom("Futura", size: 35))
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .frame(width: 230, height: 230)  // Tamaño del botón
                                .background(Circle().fill(Color(red: 6/255, green: 182/255, blue: 233/255)))
                                .overlay(Circle().stroke(Color.black, lineWidth: 3)) // Borde negro
                            }
                        }
                    }
                    
                    // Botón en la esquina superior izquierda
                    VStack {
                        HStack {
                            NavigationLink(destination: BookView()) {
                                Image("Libro")
                                    .resizable()
                                    .opacity(0.90)
                                    .frame(width: 75, height: 75)
                                    .padding()
                            }
                            Spacer()
                        }
                        Spacer()
                        
                        // Botón Language Switcher al fondo
                        HStack {
                            LanguageSwitcher()
                        }.offset(x:495, y:-690)
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
        }
    }

    #Preview {
        CulturaView()
            .environmentObject(LanguageManager()) // Proporciona el EnvironmentObject aquí
    }
