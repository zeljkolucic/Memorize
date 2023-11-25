//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Zeljko Lucic on 4.11.23..
//

import SwiftUI

struct EmojiMemoryGameView: View {
    typealias Card = MemoryGame<String>.Card
    @ObservedObject var viewModel = EmojiMemoryGame()
    
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
    var body: some View {
        VStack {
            cards
                .foregroundStyle(viewModel.color)
            HStack {
                score
                Spacer()
                shuffle
            }
            .font(.largeTitle)
        }
        .padding()
    }
    
    private var score: some View {
        Text("Score: \(viewModel.score)")
            .animation(nil)
    }
    
    private var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                viewModel.shuffle()
            }
        }
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(spacing)
                .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                .zIndex(scoreChange(causedBy: card) != 0 ? 100 : 0)
                .onTapGesture {
                    choose(card)
                }
        } 
    }
    
    private func choose(_ card: Card) {
        withAnimation(.easeInOut(duration: 1)) {
            let scoreBeforeChoosing = viewModel.score
            viewModel.choose(card)
            let scoreChange = viewModel.score - scoreBeforeChoosing
            lastScoreChange = (scoreChange, card.id)
        }
    }
    
    @State private var lastScoreChange = (0, casuedByCardId: UUID())
    
    private func scoreChange(causedBy card: Card) -> Int {
        let (amount, id) = lastScoreChange
        return card.id == id ? amount : 0 
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
