//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by ahmed alfrash on 01/06/2021.
//

import SwiftUI



class EmojiMemoryGame {
    
    private var memoryGame: MemoryGame<String> = createEmojiMemoryGame()
    
    static let emojis  = ["🤡", "🦇", "😷", "🧟‍♂️", "🤧", "☃️", "🌩", "🥷", "🧟‍♀️", "🧙🏻", "🦸‍♀️", "🦹🏻‍♀️", "👺", "💩", "👻", "💀", "☠️", "👽", "👾", "🤖", "🎃", "🐶", "🐱", "🐭"]
    
    static func createEmojiMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: 16){ pairIndex in emojis[pairIndex]}
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        memoryGame.cards
    }
    
}
