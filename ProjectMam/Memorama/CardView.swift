import SwiftUI

struct CardView: View {
    let card: Card
    var size: CGFloat
    
    var body: some View {
        ZStack {
            if card.isFlipped || card.isMatched {
                Image(card.content)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
            } else {
                Rectangle()
                    .fill(Color(red: 251/255, green: 175/255, blue: 0/255))
                    .frame(width: size, height: size)
            }
        }
        .frame(width: size, height: size)
        .cornerRadius(10)
        .shadow(radius: 5)
        .rotation3DEffect(
            .degrees(card.isFlipped ? 0 : 180),
            axis: (x: 0, y: 1, z: 0)
        )
        .animation(.easeInOut(duration: 0.5), value: card.isFlipped)
    }
}
