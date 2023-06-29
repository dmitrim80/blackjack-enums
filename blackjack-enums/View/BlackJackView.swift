//
//  ContentView.swift
//  blackjack-enums
//
//  Created by Dmitri Morozov on 6/17/23.
//

import SwiftUI


struct BlackJackView: View {
    
    @EnvironmentObject var blackJackViewModel:BlackJackViewModel
    
    var body: some View {
        ZStack {
            backgroundSet
            
            VStack{
                blackJackScore
                
                HStack(alignment: .top, spacing: 0){
                    CardView(playerCard: $blackJackViewModel.playerCard1)
                    CardView(playerCard: $blackJackViewModel.playerCard2)
                    if blackJackViewModel.hitCardCount >= 1 {
                        CardView(playerCard: $blackJackViewModel.playerCard3)
                    }
                    if blackJackViewModel.hitCardCount >= 2 {
                        CardView(playerCard: $blackJackViewModel.playerCard4)
                    }
                    Spacer()
                    CardView(playerCard: $blackJackViewModel.cpuCard1)
                    if blackJackViewModel.playerStand {
                        CardView(playerCard: $blackJackViewModel.cpuCard2)
                    } else {
                        
                        CardView(playerCard: $blackJackViewModel.playingCardBack)
                    }
                }.padding(.top, 50)
                    .padding(.bottom, 100)
                    .padding(50)
                HStack(alignment: .top){
                    Button {
                        blackJackViewModel.playerStand = false
                        playerHandCount()
                        
                    } label: {
                        VStack(spacing: 0) {
                            RoundButton(iconName: "heart.fill")
                        }
                    }

                }
                HStack{
                    VStack{
                        Button {
                            blackJackViewModel.playerStand = true
                            
                        } label: {
                            CircleButton(iconName: "dollarsign.circle")
                        }
                        Text("Stand")
                            .bold()
                            .font(.title2)
                            .background(Color.green)
                        
                    }
                    VStack{
                        Button {
                            
                        } label: {
                            CircleButton(iconName: "dollarsign.circle")
                                
                        }
                        Text("Split")
                            .bold()
                            .font(.title2)
                            .background(Color.green)
                        
                    }
                    VStack{
                        Button {
                            
                        } label: {
                            CircleButton(iconName: "dollarsign.circle")
                        }
                        Text("Double")
                            .bold()
                            .font(.title2)
                            .background(Color.green)
                        
                    }
                    VStack(alignment: .center){
                        Button {
                            if blackJackViewModel.hitCardCount == 2 {
                                blackJackViewModel.hitCardCount = 0
                            } else {
                                blackJackViewModel.hitCardCount += 1
                            }
                            
                            blackJackViewModel.scoreText = String(blackJackViewModel.playerScore) + "           " + String(blackJackViewModel.cpuScore)
                           
                        } label: {
                            CircleButton(iconName: "dollarsign.circle")
                                
                        }
                        Text("Hit")
                            .bold()
                            .font(.title2)
                            .background(Color.green)
                    }
                }.padding(.bottom,20)
            }
        }
    }

    func playerHandCount() {
        blackJackViewModel.hitCardCount = 0
        var newdeck = blackJackViewModel.makeDeck()
        
        // Player Hand
        var playerHand: [CardModel] = []
        playerHand.append(newdeck.removeLast())
        if let lastCard = playerHand.last {
            blackJackViewModel.playerCard1 = lastCard.card.rawValue
            } else {
                return
            }
        playerHand.append(newdeck.removeLast())
        if let lastCard = playerHand.last {
            blackJackViewModel.playerCard2 = lastCard.card.rawValue
            } else {
                return
            }
        if blackJackViewModel.hitCardCount >= 1 {
            playerHand.append(newdeck.removeLast())
            if let lastCard = playerHand.last {
                blackJackViewModel.playerCard3 = lastCard.card.rawValue
                } else {
                    return
                }
        }
        if blackJackViewModel.hitCardCount == 2 {
            playerHand.append(newdeck.removeLast())
            if let lastCard = playerHand.last {
                blackJackViewModel.playerCard4 = lastCard.card.rawValue
                } else {
                    return
                }
        }
        
        
        // CPU Hand
        var cpuHand: [CardModel] = []
        cpuHand.append(newdeck.removeLast())
        if let lastCard = cpuHand.last {
            blackJackViewModel.cpuCard1 = lastCard.card.rawValue
                if lastCard.card.value != 1 {
                    blackJackViewModel.cpuFirstCardValue = lastCard.card.value }
                else { blackJackViewModel.cpuFirstCardValue = 11 }
            } else {
                return
            }
        cpuHand.append(newdeck.removeLast())
            if let lastCard = cpuHand.last {
                blackJackViewModel.cpuCard2 = lastCard.card.rawValue
            } else {
                return
            }
        
        blackJackViewModel.playerScore = blackJackViewModel.getScore(hand: playerHand)
        if blackJackViewModel.playerStand {
            blackJackViewModel.cpuScore = blackJackViewModel.getScore(hand: cpuHand)
        } else{
            blackJackViewModel.cpuScore = blackJackViewModel.cpuFirstCardValue
        }
    }
    
    var backgroundSet: some View {
        RadialGradient(colors: [Color.yellow,Color.green,Color.black], center: .center, startRadius: 5, endRadius: 500)
            .opacity(0.7)
            .ignoresSafeArea()
    }
    var blackJackScore: some View{
        HStack{
            Text("\(blackJackViewModel.playerScore)")
                .font(.largeTitle)
                .foregroundColor(.black)
                .opacity(1)//blackJackViewModel.playerStand ? 0.7 : 0.0)
                .shadow(color: .orange, radius: 0.5, x: 5, y: 5)
                .fontWeight(.heavy)
                .scaleEffect(1.3)
                .padding(.leading,70)
            Spacer()
            Text("\(blackJackViewModel.cpuScore)")
                .font(.largeTitle)
                .foregroundColor(.black)
                .opacity(1)//blackJackViewModel.playerStand ? 0.7 : 0.0)
                .shadow(color: .orange, radius: 0.5, x: 5, y: 5)
                .fontWeight(.heavy)
                .scaleEffect(1.3)
                .padding(.trailing,70)
                
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BlackJackView().environmentObject(BlackJackViewModel())
    }
}
