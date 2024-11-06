import SwiftUI

class GameViewModel: ObservableObject {
    @Published var cards: [Card] = []
    @Published var flippedCards: [Card] = []
    
    init() {
        setupGame()
    }
    
    func setupGame() {
        let contents = ["Memo1", "Memo2", "Memo3", "Memo4", "Memo5", "Memo6"] // Nombres de las imágenes en los assets
        cards = (contents + contents).shuffled().map { Card(content: $0) }
    }
    
    func flipCard(_ card: Card) {
        guard let index = cards.firstIndex(where: { $0.id == card.id }),
              !cards[index].isMatched,
              flippedCards.count < 2,
              !cards[index].isFlipped
        else { return }

        cards[index].isFlipped.toggle()
        flippedCards.append(cards[index])

        if flippedCards.count == 2 {
            checkForMatch()
        }
    }
    
    func checkForMatch() {
        guard flippedCards.count == 2 else { return }
        
        if flippedCards[0].content == flippedCards[1].content {
            for card in flippedCards {
                if let index = cards.firstIndex(where: { $0.id == card.id }) {
                    cards[index].isMatched = true
                }
            }
            flippedCards.removeAll()
            checkIfGameCompleted()
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                for card in self.flippedCards {
                    if let index = self.cards.firstIndex(where: { $0.id == card.id }) {
                        self.cards[index].isFlipped = false
                    }
                }
                self.flippedCards.removeAll()
            }
        }
    }
    
    func checkIfGameCompleted() {
        if cards.allSatisfy({ $0.isMatched }) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.setupGame()
            }
        }
    }
}
