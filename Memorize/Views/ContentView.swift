//
//  ContentView.swift
//  Memorize
//
//  Created by ahmed alfrash on 22/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]){
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
    let card: MemoryGame<String>.Card
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20.0)
        ZStack {
            if card.isFaceUp{
                shape
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3.0)
                Text(card.content)
                    .font(.largeTitle)
            }else if card.isMatched{
                shape.opacity(0)
            }else{
                shape
                    .fill()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let emojiMemoryGame = EmojiMemoryGame()
        
        ContentView(viewModel: emojiMemoryGame)
            .preferredColorScheme(.dark)
        
    }
}
