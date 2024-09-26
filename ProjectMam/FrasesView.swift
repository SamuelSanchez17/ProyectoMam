import SwiftUI

struct FrasesView: View {
    @EnvironmentObject var languageManager: LanguageManager // Importamos el languageManager
    @State private var currentPhrase: String = "Texto" // Frase inicial
    @State private var buttonTexts: [String] = [
        "Texto Botón 1",
        "Texto Botón 2",
        "Texto Botón 3",
        "Texto Botón 4",
        "Texto Botón 5"
    ] // Textos iniciales de los botones

    private let phrases: [String] = [
        "Frase 1",
        "Frase 2",
        "Frase 3",
        "Frase 4",
        "Frase 5"
    ] // Lista de frases

    private let buttonOptions: [[String]] = [
        ["Nuevo Texto 1", "Nuevo Texto 2", "Nuevo Texto 3"],
        ["Nuevo Texto 4", "Nuevo Texto 5", "Nuevo Texto 6"],
        ["Nuevo Texto 7", "Nuevo Texto 8", "Nuevo Texto 9"],
        ["Nuevo Texto 10", "Nuevo Texto 11", "Nuevo Texto 12"],
        ["Nuevo Texto 13", "Nuevo Texto 14", "Nuevo Texto 15"]
    ] // Lista de textos posibles para cada botón

    var body: some View {
        ZStack {
            Color(red: 8/255, green: 203/255, blue: 98/255)
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                HStack {
                    Image("Avatar")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .offset(x:0, y:-60)

                    Image("Dialogo")
                        .resizable()
                        .frame(width: 850, height: 300)
                        .scaleEffect(x: -1, y: 1, anchor: .center)
                        .offset(x: -70, y: -170)
                }.offset(x:0, y:-100)

                HStack {
                    Button(action: {
                        // Imprimir la letra actual en la consola
                        print("Texto")
                    }) {
                        Image("Bocina")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .offset(x:-130, y:-10)
                    }
                    .buttonStyle(PlainButtonStyle())

                    Text(currentPhrase) // Mostrar la frase actual
                        .font(.custom("Futura", size: 40))
                        .bold()
                        .foregroundColor(.white)
                        .offset(x: -100, y: -15)
                }
                .offset(x: 0, y: -250)

            }
            .offset(x: 50, y: 0)
            
            VStack {
                HStack {
                    Button(action: {
                        // Cambiar texto del botón 1 al azar
                        buttonTexts[0] = buttonOptions[0].randomElement() ?? "Texto Botón 1"
                    }) {
                        VStack {
                            Text(buttonTexts[0])
                                .font(.headline)
                                .multilineTextAlignment(.center)
                                .lineLimit(nil)
                        }
                        .frame(width: 300, height: 120)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                    
                    Button(action: {
                        // Cambiar texto del botón 2 al azar
                        buttonTexts[1] = buttonOptions[1].randomElement() ?? "Texto Botón 2"
                    }) {
                        VStack {
                            Text(buttonTexts[1])
                                .font(.headline)
                                .multilineTextAlignment(.center)
                                .lineLimit(nil)
                        }
                        .frame(width: 300, height: 120)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                    
                    Button(action: {
                        // Cambiar texto del botón 3 al azar
                        buttonTexts[2] = buttonOptions[2].randomElement() ?? "Texto Botón 3"
                    }) {
                        VStack {
                            Text(buttonTexts[2])
                                .font(.headline)
                                .multilineTextAlignment(.center)
                                .lineLimit(nil)
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
                        // Cambiar texto del botón 4 al azar
                        buttonTexts[3] = buttonOptions[3].randomElement() ?? "Texto Botón 4"
                    }) {
                        VStack {
                            Text(buttonTexts[3])
                                .font(.headline)
                                .multilineTextAlignment(.center)
                                .lineLimit(nil)
                        }
                        .frame(width: 300, height: 120)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                    
                    Button(action: {
                        // Cambiar texto del botón 5 al azar
                        buttonTexts[4] = buttonOptions[4].randomElement() ?? "Texto Botón 5"
                    }) {
                        VStack {
                            Text(buttonTexts[4])
                                .font(.headline)
                                .multilineTextAlignment(.center)
                                .lineLimit(nil)
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
                    // Cambiar a una frase aleatoria
                    currentPhrase = phrases.randomElement() ?? ""
                    // Cambiar todos los textos de los botones al azar
                    for index in 0..<buttonTexts.count {
                        buttonTexts[index] = buttonOptions[index].randomElement() ?? "Texto Botón \(index + 1)"
                    }
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
