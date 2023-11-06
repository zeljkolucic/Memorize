//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by Zeljko Lucic on 5.11.23..
//

import SwiftUI

func createCardContent(forPairAtIndex index: Int) -> String {
    return ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"][index]
}

class EmojiMemorizeGame {
    private var model = MemorizeGame(numberOfPairsOfCards: 4, cardContentFactory: createCardContent)
    
    var cards: [MemorizeGame<String>.Card] {
        return model.cards
    }
    
    func choose(_ card: MemorizeGame<String>.Card) {
        model.choose(card: card)
    }
}
