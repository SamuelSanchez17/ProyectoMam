// ContentView.swift
import SwiftUI

struct MatchGameView: View {
    @StateObject private var viewModel = MatchViewModel()
    
    var body: some View {
        ZStack{
            Color(red:  0/255, green: 251/255, blue: 213/255)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Juego de Match")
                    .font(.largeTitle)
                    .padding()
                
                Text("Puntuación: \(viewModel.score)")
                    .font(.title2)
                    .padding(.bottom, 20)
                
                // Imagen central desde Assets
                if let currentImage = viewModel.currentImage {
                    Image(currentImage.imageName ?? "")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding()
                }
                
                Spacer()
                
                // Opciones de palabras
                VStack(spacing: 10) {
                    HStack(spacing: 20) {
                        ForEach(viewModel.options.prefix(3)) { item in
                            WordOptionView(item: item, action: {
                                viewModel.selectOption(item)
                            })
                        }
                    }
                    
                    HStack(spacing: 20) {
                        ForEach(viewModel.options.suffix(2)) { item in
                            WordOptionView(item: item, action: {
                                viewModel.selectOption(item)
                            })
                        }
                    }
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
            // Alerta al finalizar el juego
            .alert(isPresented: $viewModel.isGameOver) {
                Alert(
                    title: Text("Juego Terminado"),
                    message: Text("Puntuación final: \(viewModel.score)"),
                    primaryButton: .default(Text("Reiniciar"), action: {
                        viewModel.resetGame() // Reinicia el juego
                    }),
                    secondaryButton: .cancel(Text("Cerrar")) // Botón de cierre sin acción
                )
            }
        }
    }
    // Vista auxiliar para las opciones de palabras
    struct WordOptionView: View {
        let item: MatchItem
        let action: () -> Void
        
        var body: some View {
            Text(item.text ?? "")
                .font(.title)
                .padding()
                .frame(width: 180, height: 50)
                .background(Color(red:  90/255, green: 220/255, blue: 6/255)
                    .edgesIgnoringSafeArea(.all))
                .cornerRadius(8)
                .onTapGesture {
                    action()
                }
        }
    }
}
    
    #Preview {
        MatchGameView()
    }
