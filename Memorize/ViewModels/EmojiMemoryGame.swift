//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by ahmed alfrash on 01/06/2021.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    @Published private var memoryGame = createEmojiMemoryGame()
    
    private static let emojis  = ["🤡", "🦇", "😷", "🧟‍♂️", "🤧", "☃️", "🌩", "🥷", "🧟‍♀️", "🧙🏻", "🦸‍♀️", "🦹🏻‍♀️", "👺", "💩", "👻", "💀", "☠️", "👽", "👾", "🤖", "🎃", "🐶", "🐱", "🐭"]
    
    
    
    private static func createEmojiMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: 8){ pairIndex in emojis[pairIndex]}
    }
    
    var cards: [Card] {
        memoryGame.cards
    }
    
    //MARK:- Intent
    func choose(_ card: Card) {
        memoryGame.choose(card)
    }
    
}
