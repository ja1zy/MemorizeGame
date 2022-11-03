//
//  Practice1RealApp.swift
//  Practice1Real
//
//  Created by Jasdeep saran on 2022-03-13.
//real app

import SwiftUI

@main
struct Practice1RealApp: App {
    let game = EmojiMemoryGame()
    //emojimemory game is immumateable as we can point towards i
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
