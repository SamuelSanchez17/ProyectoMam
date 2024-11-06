import Foundation

struct Card: Identifiable {
    let id = UUID()
    var isFlipped = false
    var isMatched = false
    var content: String // Será el nombre de la imagen en los assets
}
