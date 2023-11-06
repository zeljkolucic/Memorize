//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Zeljko Lucic on 5.11.23..
//

import SwiftUI

class EmojiMemoryGame {
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
    
    private var model = MemoryGame(numberOfPairsOfCards: 4, cardContentFactory: { pairIndex in
        if emojis.indices.contains(pairIndex) {
            return emojis[pairIndex]
        } else {
            return "‼️"
        }
    })
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
