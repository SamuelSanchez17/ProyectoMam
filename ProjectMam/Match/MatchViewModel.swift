// MatchViewModel.swift
import SwiftUI

class MatchViewModel: ObservableObject {
    @Published var currentImage: MatchItem?
    @Published var options: [MatchItem] = []
    @Published var score: Int = 0
    @Published var isGameOver: Bool = false // Variable para mostrar el popup de juego terminado
    
    private var allItems: [MatchItem] = [
        MatchItem(text: "Marimba", imageName: "Match1"),
        MatchItem(text: "Pantalon", imageName: "Match2"),
        MatchItem(text: "Niña", imageName: "Match3"),
        MatchItem(text: "Árbol", imageName: "Match4"),
        MatchItem(text: "Niño", imageName: "Match5"),
        MatchItem(text: "Maíz", imageName: "Match6"),
        MatchItem(text: "Trigo", imageName: "Match7"),
        MatchItem(text: "Fogata", imageName: "Match8"),
        MatchItem(text: "Cantimplora", imageName: "Match9"),
        MatchItem(text: "Jarra", imageName: "Match10"),
        MatchItem(text: "Abuelo", imageName: "Match11"),
        MatchItem(text: "Abuela", imageName: "Match12"),
        MatchItem(text: "Café", imageName: "Match13")
    ]
    
    private var remainingItems: [MatchItem] // Lista de elementos restantes para no repetir
    
    init() {
        remainingItems = allItems.shuffled() // Mezcla inicial
        loadNewRound()
    }
    
    func loadNewRound() {
        // Si no quedan más elementos, el juego termina
        if remainingItems.isEmpty {
            isGameOver = true
            return
        }
        
        // Selecciona el último elemento de `remainingItems` para evitar repeticiones
        if let selectedItem = remainingItems.popLast() {
            currentImage = selectedItem
            generateOptions(for: selectedItem)
        }
    }
    
    private func generateOptions(for correctItem: MatchItem) {
        var incorrectOptions = allItems.filter { $0.id != correctItem.id }
        incorrectOptions.shuffle()
        
        // Selecciona solo 4 opciones incorrectas y añade la correcta
        options = Array(incorrectOptions.prefix(4))
        options.append(correctItem)
        options.shuffle()
    }
    
    func selectOption(_ option: MatchItem) {
        // Suma al puntaje si es correcta
        if option.id == currentImage?.id {
            score += 1
        }
        loadNewRound() // Carga una nueva imagen y opciones
    }
    
    func resetGame() {
        remainingItems = allItems.shuffled() // Reinicia la lista mezclada
        score = 0
        isGameOver = false
        loadNewRound()
    }
}
