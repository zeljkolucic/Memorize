//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Zeljko Lucic on 5.11.23..
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
    
    @Published private var model = MemoryGame(numberOfPairsOfCards: 11, cardContentFactory: { pairIndex in
        if emojis.indices.contains(pairIndex) {
            return emojis[pairIndex]
        } else {
            return "‼️"
        }
    })
    
    var cards: [Card] {
        return model.cards
    }
    
    // MARK: - Intents
    
    func choose(_ card: Card) {
        model.choose(card: card)
    }
    
    func shuffle() {
        model.shuffle()
    }
}
