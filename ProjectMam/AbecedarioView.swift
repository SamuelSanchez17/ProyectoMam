import SwiftUI

struct AbecedarioView: View {
    @EnvironmentObject var languageManager: LanguageManager
    @State private var currentLetterIndex = 0
    let alphabet = [
        "A", "B'", "CH", "CH'", "E", "I", "J", "K", "K'", "KY", "KY'", "L", "M", "N", "O", "P", "Q", "Q'", "R", "S", "T", "T'", "TX", "TX'", "TZ", "TZ'", "U", "W", "X", "Ẍ", "Y",
        "a", "b'", "ch", "ch'", "e", "i", "j", "k", "k'", "ky", "ky'", "l", "m", "n", "o", "p", "q", "q'", "r", "s", "t", "t'", "tx", "tx'", "tz", "tz'", "u", "w", "x", "ẍ", "y"
    ]

    var body: some View {
        ZStack {
            Color(red: 8/255, green: 203/255, blue: 98/255)
                .edgesIgnoringSafeArea(.all)

            ZStack {
                HStack {
                    Image("Avatar")
                        .resizable()
                        .frame(width: 300, height: 300)

                    Image("Dialogo")
                        .resizable()
                        .frame(width: 850, height: 400)
                        .scaleEffect(x: -1, y: 1, anchor: .center)
                        .offset(x: -70, y: -170)
                }.offset(x:0,y:70)

                HStack {
                    Button(action: {
                        // Imprimir la letra actual en la consola
                        print("Letra actual pronunciada: \(currentLetter)")
                    }) {
                        Image("Bocina")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }
                    .buttonStyle(PlainButtonStyle())

                    Text(currentLetter)
                        .font(.custom("Futura", size: 60))
                        .bold()
                        .foregroundColor(.white)
                        .offset(x: 50, y: 0)
                }
                .offset(x: -60, y: -80)

            }
            .offset(x: 50, y: 0)

            HStack(spacing: 20) {
                // Botón con flecha a la izquierda
                Button(action: {
                    // Cambia la letra al índice anterior
                    currentLetterIndex = (currentLetterIndex - 1 + (alphabet.count / 2)) % (alphabet.count / 2)
                    print("Botón de flecha izquierda presionado: \(currentLetter)")
                }) {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .scaledToFit()
                        .padding(20)
                        .frame(width: 100, height: 100)
                        .background(Color.red)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
                .offset(x: -450, y: 350)

                // Botón con flecha a la derecha
                Button(action: {
                    // Cambia la letra al siguiente índice
                    currentLetterIndex = (currentLetterIndex + 1) % (alphabet.count / 2)
                    print("Botón de flecha derecha presionado: \(currentLetter)")
                }) {
                    Image(systemName: "arrow.right")
                        .resizable()
                        .scaledToFit()
                        .padding(20)
                        .frame(width: 100, height: 100)
                        .background(Color(red: 0.2, green: 0.6, blue: 0.8))
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
                .offset(x: 450, y: 350)
            }
            .padding()
        }
        
    }

    private var currentLetter: String {
        let index = currentLetterIndex % (alphabet.count / 2)
        let uppercaseLetter = alphabet[index]
        let lowercaseLetter = alphabet[index + (alphabet.count / 2)]
        return "\(uppercaseLetter) / \(lowercaseLetter)"
    }
}

#Preview {
    AbecedarioView()
        .environmentObject(LanguageManager())
}
