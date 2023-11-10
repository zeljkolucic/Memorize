//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Zeljko Lucic on 4.11.23..
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel = EmojiMemoryGame()
    
    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack {
            cards
                .animation(.default, value: viewModel.cards)
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(4)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
        .foregroundStyle(.orange)
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
