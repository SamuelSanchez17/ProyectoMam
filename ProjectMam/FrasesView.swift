import SwiftUI

struct FrasesView: View {
    @EnvironmentObject var languageManager: LanguageManager // Importamos el languageManager
    
    var body: some View {
        ZStack {
            Color(red: 8/255, green: 203/255, blue: 98/255)
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                Image("Avatar")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .offset(x: -20, y: -110)

                Image("Dialogo")
                    .resizable()
                    .frame(width: 800, height: 300)
                    .scaleEffect(x: -1, y: 1, anchor: .center)
                    .offset(x: -90, y: -170)

                Button(action: {
                    print("Imagen botón tocada")
                }) {
                    Image("Bocina")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                }
                .buttonStyle(PlainButtonStyle())
                .offset(x: -790, y: -160)
            }
            .offset(x: 80, y: -90)
            
            VStack {
                HStack {
                    Button(action: {
                        print("Botón 1 presionado")
                    }) {
                        VStack {
                            Text(languageManager.getLocalizedText(for: "button1_text")) // Usa el texto localizado
                        }
                        .frame(width: 300, height: 120)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                    
                    // Repite esto para los demás botones usando getLocalizedText
                    Button(action: {
                        print("Botón 2 presionado")
                    }) {
                        VStack {
                            Text(languageManager.getLocalizedText(for: "button2_text"))
                                .font(.headline)
                        }
                        .frame(width: 300, height: 120)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                    
                    Button(action: {
                        print("Botón 3 presionado")
                    }) {
                        VStack {
                            Text(languageManager.getLocalizedText(for: "button3_text"))
                                .font(.headline)
                        }
                        .frame(width: 300, height: 120)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                }
                
                HStack {
                    Button(action: {
                        print("Botón 4 presionado")
                    }) {
                        VStack {
                            Text(languageManager.getLocalizedText(for: "button4_text"))
                                .font(.headline)
                        }
                        .frame(width: 300, height: 120)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                    
                    Button(action: {
                        print("Botón 5 presionado")
                    }) {
                        VStack {
                            Text(languageManager.getLocalizedText(for: "button5_text"))
                                .font(.headline)
                        }
                        .frame(width: 300, height: 120)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                }
            }
            .offset(x: 0, y: 120)
            
            HStack(spacing: 20) {
                
                Button(action: {
                    print("Botón de flecha derecha presionado")
                }) {
                    Image(systemName: "arrow.right")
                        .resizable()
                        .scaledToFit()
                        .padding(20)
                        .frame(width: 60, height: 60)
                        .background(Color(red: 0.2, green: 0.6, blue: 0.8))
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
                .offset(x: 500, y: 350)
            }
            .padding()
        }
    }
}

#Preview {
    FrasesView()
        .environmentObject(LanguageManager()) // Proporciona el EnvironmentObject aquí
}
