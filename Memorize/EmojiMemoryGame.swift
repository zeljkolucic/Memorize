//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Zeljko Lucic on 5.11.23..
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
    
    @Published private var model = MemoryGame(numberOfPairsOfCards: 7, cardContentFactory: { pairIndex in
        if emojis.indices.contains(pairIndex) {
            return emojis[pairIndex]
        } else {
            return "‼️"
        }
    })
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    // MARK: - Intents
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func shuffle() {
        model.shuffle()
    }
}
