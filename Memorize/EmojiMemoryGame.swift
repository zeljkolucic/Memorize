//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Zeljko Lucic on 5.11.23..
//

import SwiftUI

func createCardContent(forPairAtIndex index: Int) -> String {
    return ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"][index]
}

class EmojiMemoryGame {
    private var model = MemoryGame(numberOfPairsOfCards: 4, cardContentFactory: createCardContent)
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
