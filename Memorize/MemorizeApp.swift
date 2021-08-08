//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Đorđije Novović on 2.8.21..
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
