//
//  blackjack_enumsApp.swift
//  blackjack-enums
//
//  Created by Dmitri Morozov on 6/17/23.
//

import SwiftUI

@main
struct blackjack_enumsApp: App {
    
    @StateObject var blackJackViewModel: BlackJackViewModel = BlackJackViewModel()
    
    var body: some Scene {
        WindowGroup {
            BlackJackView()
                .environmentObject(blackJackViewModel)
        }
    }
}
