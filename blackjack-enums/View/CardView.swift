//
//  CardView.swift
//  blackjack-enums
//
//  Created by Dmitri Morozov on 6/21/23.
//

import SwiftUI

struct CardView: View {
    
    @Binding var playerCard: String
    
    var body: some View {
        Text($playerCard.wrappedValue)
                .font(.largeTitle)
                .foregroundColor(
                    // Clubs & Spades characters
                    $playerCard.wrappedValue.contains("🂢") ||
                    $playerCard.wrappedValue.contains("🂢") ||
                    $playerCard.wrappedValue.contains("🂣") ||
                    $playerCard.wrappedValue.contains("🂤") ||
                    $playerCard.wrappedValue.contains("🂥") ||
                    $playerCard.wrappedValue.contains("🂦") ||
                    $playerCard.wrappedValue.contains("🂧") ||
                    $playerCard.wrappedValue.contains("🂨") ||
                    $playerCard.wrappedValue.contains("🂩") ||
                    $playerCard.wrappedValue.contains("🂪") ||
                    $playerCard.wrappedValue.contains("🂫") ||
                    $playerCard.wrappedValue.contains("🂭") ||
                    $playerCard.wrappedValue.contains("🂮") ||
                    $playerCard.wrappedValue.contains("🃑") ||
                    $playerCard.wrappedValue.contains("🃒") ||
                    $playerCard.wrappedValue.contains("🃓") ||
                    $playerCard.wrappedValue.contains("🃔") ||
                    $playerCard.wrappedValue.contains("🃕") ||
                    $playerCard.wrappedValue.contains("🃖") ||
                    $playerCard.wrappedValue.contains("🃗") ||
                    $playerCard.wrappedValue.contains("🃘") ||
                    $playerCard.wrappedValue.contains("🃙") ||
                    $playerCard.wrappedValue.contains("🃚") ||
                    $playerCard.wrappedValue.contains("🃛") ||
                    $playerCard.wrappedValue.contains("🃝") ||
                    $playerCard.wrappedValue.contains("🃞") ? .black : .red)
                .background(Color.white)
                .cornerRadius(5)
                .fontWeight(.heavy)
                .scaleEffect(4.5)
                .padding(5)
                .shadow(radius: 0.5)
                .shadow(color: .black, radius: 30, x: 15, y: 15)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(playerCard: Binding.constant("🂡"))
    }
}
