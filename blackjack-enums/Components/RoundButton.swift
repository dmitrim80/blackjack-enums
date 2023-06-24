//
//  RoundButton.swift
//  blackjack-enums
//
//  Created by Dmitri Morozov on 6/20/23.
//

import SwiftUI
struct RoundButton: View {
    
    let iconName: String
    
    var body: some View {
        ZStack{
            Image(systemName: iconName)
                .resizable()
                .scaleEffect(0.75)
                .font(.headline)
                .foregroundColor(.red)
                .frame(width:75, height: 75)
                .background(
                    Circle()
                        .offset(y:-5)
                        .foregroundColor(.blue)
                ).shadow(
                    color: .white.opacity(0.9),
                    radius: 15,
                    x: 0,
                    y: 0)
                .padding()
            Text("GO!")
                .bold()
                .foregroundColor(.black)
                
        }
    }
}

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton(iconName: "heart.fill")
                .padding()
                .previewLayout(.sizeThatFits)
        
    }
}
