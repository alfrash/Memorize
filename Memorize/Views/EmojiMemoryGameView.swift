//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by ahmed alfrash on 22/05/2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]){
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

struct CardView: View {
    
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            ZStack {
                if card.isFaceUp{
                    shape
                        .foregroundColor(.white)
                    shape
                        .strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content)
                        .font(font(in: geometry.size))
                }else if card.isMatched{
                    shape.opacity(0)
                }else{
                    shape
                        .fill()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * Constants.fontScale.rawValue)
    }
}


// I can use structs with static let or enum with Raw Values to create constants
struct DrawingConstants {
    static let cornerRadius: CGFloat = 20.0
    static let lineWidth: CGFloat = 3.0
    static let fontScale: CGFloat = 0.7
}
enum Constants: CGFloat {
    case cornerRadius = 20.0
    case lineWidth = 3.0
    case fontScale = 0.7
}


struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        
        let emojiMemoryGame = EmojiMemoryGame()
        
        EmojiMemoryGameView(viewModel: emojiMemoryGame)
            .preferredColorScheme(.dark)
        
    }
}

