import SwiftUI

struct PalabrasView: View {
    @EnvironmentObject var languageManager: LanguageManager // Importamos el languageManager
    
    // Lista de frases y respuestas correctas
    let phrases = [
        ("Chej", "Caballo"),
        ("B'ech", "Flor"),
        ("Chyu'j", "Pájaro"),
        ("Xjab'", "Zapato")
    ]
    
    // Imágenes y textos para los botones
    let buttonImagesDict: [String: String] = [
        "Caballo": "Caballo",
        "Flor": "Flor",
        "Pájaro": "Pajaro",
        "Zapato": "Zapato",
        "Perro": "Perro",
        "Gato": "Gato",
        "Mesa": "Mesa",
        "Silla": "Silla",
        "Pelota": "Pelota",
        "Lápiz": "Lapiz",
        "Casa": "Casa1",
        "Río": "Rio"
    ]
    
    let buttonTexts = [
        "Caballo", "Flor", "Pájaro", "Zapato", // Correctas
        "Perro", "Gato", "Mesa", "Silla", // Nuevas incorrectas
        "Pelota", "Lápiz", "Casa", "Río" // Nuevas incorrectas
    ]
    
    @State private var currentPhrase: String = ""
    @State private var selectedAnswerIndex: Int? = nil // Índice del botón seleccionado
    @State private var buttonStates: [(image: String, text: String)] = []
    @State private var usedPhrases: Set<String> = []
    @State private var score: Int = 0
    @State private var totalQuestions: Int = 0
    @State private var showResult: Bool = false
    @State private var checkedAnswer: Bool = false // Indica si se ha comprobado la respuesta
    @State private var isAnswerLocked: Bool = false // Indica si las respuestas están bloqueadas
    @State private var showFelicitacion: Bool = false // Nueva variable de estado

    init() {
        // Inicializa con una frase aleatoria
        let randomPhrase = phrases.randomElement()
        _currentPhrase = State(initialValue: randomPhrase?.0 ?? "Hola")
    }

    var body: some View {
        ZStack {
            Image("Bosque")
                .resizable()
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Image("Dialogo")
                        .resizable()
                        .frame(width: 800, height: 250)
                        .scaleEffect(x: -1, y: 1, anchor: .center)
                        .offset(x: 120, y: -20)

                    HStack {
                        Button(action: {
                            print("Imagen botón tocada")
                        }) {
                            Image("Bocina")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                        }
                        .buttonStyle(PlainButtonStyle())

                        Text(currentPhrase)
                            .font(.custom("Futura", size: 40))
                            .bold()
                            .foregroundColor(.white)
                            .offset(x: 55)
                    }
                    .padding(.leading, 20)
                    .offset(x: -600, y: 0)
                }
                .padding(.top, 20)

                Spacer()

                HStack(spacing: 20) {
                    ForEach(buttonStates.indices, id: \.self) { index in
                        Button(action: {
                            if !isAnswerLocked { // Solo selecciona si no está bloqueado
                                selectedAnswerIndex = index // Selecciona el botón
                                checkedAnswer = false // Reinicia la verificación
                            }
                        }) {
                            VStack {
                                Image(buttonStates[index].image) // Usa la imagen correspondiente
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 180, height: 180)
                                Text(buttonStates[index].text) // Muestra el texto traducido
                                    .font(.headline)
                            }
                            .frame(width: 250, height: 250)
                            .background(
                                selectedAnswerIndex == index ? (checkedAnswer ? (isCorrectAnswer(index: index) ? Color.green : Color.red) : Color.blue) : Color.white
                            )
                            .cornerRadius(25.0)
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.blue, lineWidth: selectedAnswerIndex == index ? 2 : 0))
                            .opacity(isAnswerLocked ? (selectedAnswerIndex == index ? 1 : 0.5) : 1) // Cambia la opacidad solo después de comprobar
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding()
                        .disabled(isAnswerLocked && selectedAnswerIndex != index) // Deshabilita el botón, excepto el seleccionado
                    }
                }

                // Botón largo "Comprobar"
                Button(action: {
                    checkAnswer()
                }) {
                    Text(languageManager.getLocalizedText(for: "Comprobar"))
                        .font(.custom("Futura", size: 30))
                        .foregroundColor(.white)
                        .frame(width: 500, height: 50)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(25)
                }
                .padding(.top, 20)
                .disabled(isAnswerLocked) // Deshabilita el botón si está bloqueado

                HStack(spacing: 20) {
                    // Botón con flecha a la derecha
                    Button(action: {
                        loadNextPhrase() // Carga la siguiente frase
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
                    .disabled(selectedAnswerIndex == nil || !checkedAnswer) // Deshabilita si no hay respuesta seleccionada o no se ha comprobado
                }
                .padding(.bottom, 20)
                .offset(x: 500, y: -70)
            }
            .offset(x:0,y:80)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .alert(isPresented: $showResult) {
                Alert(title: Text(languageManager.getLocalizedText(for: "Resultado")),
                      message: Text("Respuestas correctas: \(score) de \(phrases.count)"),
                      dismissButton: .default(Text("OK")) {
                        resetGame()
                      })
            }

            // Mostrar FelicitacionView si es necesario
            if showFelicitacion {
                Color.black.opacity(0.5) // Fondo oscuro para el overlay
                    .edgesIgnoringSafeArea(.all)

                FelicitacionView(correctAnswers: score, incorrectAnswers: totalQuestions - score, showFelicitacion: $showFelicitacion) {
                    resetGame() // Llama a la función de reinicio
                }
            }
        }
        .onAppear {
            loadNextPhrase()
        }
        
    }

    private func loadNextPhrase() {
        if let newPhrase = phrases.filter({ !usedPhrases.contains($0.0) }).randomElement() {
            currentPhrase = newPhrase.0
            buttonStates = generateAnswerButtons(correctAnswer: newPhrase.1)
            usedPhrases.insert(newPhrase.0)
            totalQuestions += 1
            selectedAnswerIndex = nil // Reinicia el índice seleccionado
            checkedAnswer = false // Reinicia la verificación
            isAnswerLocked = false // Asegura que las respuestas estén desbloqueadas
        } else {
            showFelicitacion = true // Mostrar vista de felicitación
        }
    }

    private func generateAnswerButtons(correctAnswer: String) -> [(image: String, text: String)] {
        var options = [correctAnswer]
        while options.count < 4 {
            let randomText = buttonTexts.randomElement()!
            if !options.contains(randomText) {
                options.append(randomText)
            }
        }
        options.shuffle()
        
        return options.map { (text: languageManager.getLocalizedText(for: $0), image: buttonImagesDict[$0] ?? "default_image_name") }
    }

    private func checkAnswer() {
        guard let selectedIndex = selectedAnswerIndex else { return }
        let correctAnswer = phrases.first(where: { $0.0 == currentPhrase })?.1
        
        // Compara el texto traducido
        let translatedSelectedText = buttonStates[selectedIndex].text
        let localizedCorrectAnswer = languageManager.getLocalizedText(for: correctAnswer ?? "")
        
        if translatedSelectedText == localizedCorrectAnswer {
            score += 1
            print("Respuesta correcta!")
        } else {
            print("Respuesta incorrecta.")
        }
        isAnswerLocked = true // Bloquea las respuestas después de comprobar
        checkedAnswer = true // Marca que se ha comprobado la respuesta
    }
    
    private func isCorrectAnswer(index: Int) -> Bool {
        let correctAnswer = phrases.first(where: { $0.0 == currentPhrase })?.1
        let localizedCorrectAnswer = languageManager.getLocalizedText(for: correctAnswer ?? "")
        return buttonStates[index].text == localizedCorrectAnswer
    }
    
    private func resetGame() {
        usedPhrases.removeAll()
        score = 0
        totalQuestions = 0
        loadNextPhrase()
    }
}

#Preview {
    PalabrasView()
        .environmentObject(LanguageManager()) // Proporciona el EnvironmentObject aquí
}
