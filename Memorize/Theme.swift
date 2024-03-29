//
//  Theme.swift
//  Memorize
//
//  Created by Đorđije Novović on 10.8.21..
//

import Foundation

struct Theme {
    var name: String
    var emojis: Array<String>
    var numberOfPairOfCards: Int
    var color: String
    
    init(name: String, emojis: Array<String>, numberOfPairOfCards: Int, color: String) {
        self.name = name
        self.emojis = emojis
        self.numberOfPairOfCards = numberOfPairOfCards > emojis.count ? emojis.count : numberOfPairOfCards
        self.color = color
    }
}
