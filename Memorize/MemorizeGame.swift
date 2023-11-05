//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Zeljko Lucic on 5.11.23..
//

import Foundation

struct MemorizeGame<CardContent> {
    var cards: [Card]
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
