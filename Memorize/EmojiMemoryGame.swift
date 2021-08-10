//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Đorđije Novović on 4.8.21..
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    static var themes: Array<Theme> = [
        Theme(
            name: "Vehicles 🚗",
            emojis: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍", "🚔", "🚡", "🚝", "✈️", "🛶", "🛳"],
            numberOfPairOfCards: 12,
            color: "red"
        ),
        Theme(
            name: "Animals 🐬",
            emojis: ["🐬", "🐱", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐷", "🐮", "🐸", "🐔", "🐥", "🦆", "🦄", "🐝"],
            numberOfPairOfCards: 10,
            color: "blue"
        ),
        Theme(
            name: "Plants 🍏",
            emojis: ["🍏", "🍋", "🍇", "🍓", "🫐", "🍒", "🍑", "🍅", "🥑", "🌶", "🌽", "🫑", "🥕", "🧄", "🍠", "🧅"],
            numberOfPairOfCards: 8,
            color: "green"
        ),
        Theme(
            name: "Sports 🏀",
            emojis: ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎱", "🏓", "🏹", "🥊", "🥋", "🥅", "🎽", "🛼", "🤸‍♂️", "🤽‍♀️", "🚴‍♀️"],
            numberOfPairOfCards: 6,
            color: "orange"
        ),
        Theme(
            name: "Hearts 💛",
            emojis: ["❤️", "🧡", "💛", "💚", "💙", "💜", "🖤", "🤍", "🤎", "💔", "❤️‍🔥", "❤️‍🩹", "💕", "💞", "💖", "💘"],
            numberOfPairOfCards: 4,
            color: "yellow"
        ),
        Theme(
            name: "Smiles 👿",
            emojis: ["👽", "💩", "☠️", "👿", "🤠", "😷", "😵‍💫", "😎", "😍", "🥰", "😇", "😂", "😀", "🤖", "🎃", "👾"],
            numberOfPairOfCards: 8,
            color: "purple"
        )
    ]
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairOfCards) { pairIndex in
            return theme.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String>
    
    private var theme: Theme
    
    var themeColor: Color {
        switch theme.color {
        case "red":
            return .red
        case "blue":
            return .blue
        case "green":
            return .green
        case "orange":
            return .orange
        case "yellow":
            return .yellow
        case "purple":
            return .purple
        default:
            return .black
        }
    }
    
    var themeName: String {
        return theme.name
    }
    
    var score: Int {
        return model.score
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
}
