import SwiftUI

struct FelicitacionView: View {
    let correctAnswers: Int
    let incorrectAnswers: Int
    @Binding var showFelicitacion: Bool // Controlar la visibilidad
    var onRestart: () -> Void // Función para reiniciar el juego

    var body: some View {
        VStack {
            Text("¡Felicidades!")
                .font(.largeTitle)
                .bold()
                .padding()
            Text("Has completado todas las preguntas.")
                .font(.headline)
                .padding()
            Text("Respuestas correctas: \(correctAnswers)")
                .font(.subheadline)
                .padding()
            Text("Respuestas incorrectas: \(incorrectAnswers)")
                .font(.subheadline)
                .padding()
            
            HStack {
                Button(action: {
                    showFelicitacion = false // Cierra la vista de felicitación
                }) {
                    Text("Cerrar")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    onRestart() // Reiniciar el juego
                    showFelicitacion = false // Cierra la vista de felicitación
                }) {
                    Text("Reiniciar Juego")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }
            .padding(.top, 20)
        }
        .frame(width: 550, height: 400)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

#Preview {
    FelicitacionView(correctAnswers: 3, incorrectAnswers: 1, showFelicitacion: .constant(true), onRestart: {})
}
