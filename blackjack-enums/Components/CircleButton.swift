//
//  CircleButton.swift
//  blackjack-enums
//
//  Created by Dmitri Morozov on 6/24/23.
//

import SwiftUI

struct CircleButton: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .resizable()
            .shadow(color: .orange, radius: 0.5, x: 0, y: 5)
            .scaledToFit()
            .frame(width: 75, height: 75)
            .foregroundColor(.black)
            .background(Color.green)
            .cornerRadius(10)
            .shadow(color: .black, radius: 10, x: 0, y: 5)
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(iconName: "dollarsign.circle")
    }
}
