import SwiftUI

struct MemoramaView: View {
    @ObservedObject var game = GameViewModel()
    @EnvironmentObject var languageManager: LanguageManager
    
    var body: some View {
        ZStack{
            Color(red:  0/255, green: 251/255, blue: 213/255)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text(languageManager.getLocalizedText(for: "Memorama"))
                    .font(.largeTitle)
                    .padding()
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 10) {
                    ForEach(game.cards) { card in
                        CardView(card: card, size: 180) // Ajusta el tamaño aquí
                            .onTapGesture {
                                game.flipCard(card)
                            }
                    }
                }
                .padding()
            }
            HStack{
                LanguageSwitcher()
            }.offset(x:490, y:-350)
        }
    }
    
}
#Preview {
    MemoramaView()
        .environmentObject(LanguageManager())
}

