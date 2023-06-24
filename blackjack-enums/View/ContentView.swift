//
//  ContentView.swift
//  blackjack-enums
//
//  Created by Dmitri Morozov on 6/17/23.
//

import SwiftUI

struct ContentView: View {
    @State private var playerCard1: String = "🂡"
    @State private var playerCard2: String = "🂡"
    @State private var playerCard3: String = "🂡"
    @State private var playerCard4: String = "🂡"
    @State private var cpuCard1: String = "🂡"
    @State private var cpuCard2: String = "🂡"
    @State private var scoreText: String = "Blackjack!"
    @State private var playerScore: Int = 0
    @State private var cpuScore: Int = 0
    
    @State var hitCardCount: Int = 0
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color.yellow,Color.green,Color.black], center: .center, startRadius: 5, endRadius: 500)
                .opacity(0.7)
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    Text(scoreText)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .opacity(0.7)
                        .shadow(color: .orange, radius: 0.5, x: 5, y: 5)
                        .fontWeight(.heavy)
                        .scaleEffect(1.7)
                        .padding()
                }
                HStack(alignment: .top, spacing: 0){
                    CardView(playerCard: $playerCard1)
                    CardView(playerCard: $playerCard2)
                    if hitCardCount >= 1 {
                        CardView(playerCard: $playerCard3)
                    }
                    if hitCardCount >= 2 {
                        CardView(playerCard: $playerCard4)
                    }
                    Spacer()
                    CardView(playerCard: $cpuCard1)
                    CardView(playerCard: $cpuCard2)
                }.padding(.top, 50)
                    .padding(.bottom, 100)
                    .padding(50)
                HStack(alignment: .top){
                    Button {
                        hitCardCount = 0
                        var newdeck = makeDeck()
                        newdeck.shuffle()
                        
                        // Player Hand
                        var playerHand: [CardModel] = []
                        playerHand.append(newdeck.removeLast())
                        if let lastCard = playerHand.last {
                            playerCard1 = lastCard.card.rawValue
                            } else {
                                return
                            }
                        playerHand.append(newdeck.removeLast())
                        if let lastCard = playerHand.last {
                            playerCard2 = lastCard.card.rawValue
                            } else {
                                return
                            }
                        if hitCardCount >= 1 {
                            playerHand.append(newdeck.removeLast())
                            if let lastCard = playerHand.last {
                                playerCard3 = lastCard.card.rawValue
                                } else {
                                    return
                                }
                        }
                        if hitCardCount == 2 {
                            playerHand.append(newdeck.removeLast())
                            if let lastCard = playerHand.last {
                                playerCard4 = lastCard.card.rawValue
                                } else {
                                    return
                                }
                        }
                        
                        
                        // CPU Hand
                        var cpuHand: [CardModel] = []
                        cpuHand.append(newdeck.removeLast())
                        if let lastCard = cpuHand.last {
                            cpuCard1 = lastCard.card.rawValue
                            } else {
                                return
                            }
                        cpuHand.append(newdeck.removeLast())
                        if let lastCard = cpuHand.last {
                            cpuCard2 = lastCard.card.rawValue
                            } else {
                                return
                            }
                        
                        playerScore = getScore(hand: playerHand)
                        cpuScore = getScore(hand: cpuHand)
                        
                        scoreText = String(playerScore) + "           " + String(cpuScore)
                        
                        
                    // let result = getResult()
                    // let previousResult = Result.previous(result)
                        
                    } label: {
                        VStack(spacing: 0) {
                            RoundButton(iconName: "heart.fill")
                        }
                    }
                    
                }
                
                
                HStack{
                    VStack{
                        Button {
                            
                        } label: {
                            Image(systemName: "dollarsign.circle")
                                .resizable()
                                .shadow(color: .orange, radius: 0.5, x: 0, y: 5)
                                .scaledToFit()
                                .frame(width: 75, height: 75)
                                .foregroundColor(.black)
                                .background(Color.green)
                                .cornerRadius(10)
                                .shadow(color: .black, radius: 10, x: 0, y: 5)
                        }
                        Text("Stand")
                            .bold()
                            .font(.title2)
                            .background(Color.green)
                        
                    }
                    VStack{
                        Button {
                            
                        } label: {
                            Image(systemName: "dollarsign.circle")
                                .resizable()
                                .shadow(color: .orange, radius: 0.5, x: 0, y: 5)
                                .scaledToFit()
                                .frame(width: 75, height: 75)
                                .foregroundColor(.black)
                                .background(Color.green)
                                .cornerRadius(10)
                                .shadow(color: .black, radius: 10, x: 0, y: 5)
                        }
                        Text("Split")
                            .bold()
                            .font(.title2)
                            .background(Color.green)
                        
                    }
                    VStack{
                        Button {
                            
                        } label: {
                            Image(systemName: "dollarsign.circle")
                                .resizable()
                                .scaledToFit()
                                .shadow(color: .orange, radius: 0.5, x: 0, y: 5)
                                .frame(width: 75, height: 75)
                                .foregroundColor(.black)
                                .background(Color.green)
                                .cornerRadius(10)
                                .shadow(color: .black, radius: 10, x: 0, y: 5)
                        }
                        Text("Double")
                            .bold()
                            .font(.title2)
                            .background(Color.green)
                        
                    }
                    VStack(alignment: .center){
                        Button {
                            if hitCardCount == 2 {
                                hitCardCount = 0
                            } else {
                                hitCardCount += 1
                            }
                            
                            scoreText = String(playerScore) + "           " + String(cpuScore)
                           
                        } label: {
                            Image(systemName: "dollarsign.circle")
                                .resizable()
                                .scaledToFit()
                                .shadow(color: .orange, radius: 0.5, x: 0, y: 5)
                                .frame(width: 75, height: 75)
                                .foregroundColor(.black)
                                .background(Color.green)
                                .cornerRadius(10)
                                .shadow(color: .black, radius: 10, x: 0, y: 5)
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
    
    func makeDeck() -> [CardModel] {
        var deck: [CardModel] = []
       
        for card in Cards.allCases{
                deck.append(.init(card: card))
        }
        return deck
    }
    
    func getScore(hand: [CardModel]) -> Int {
        var score = 0
        var numAces = 0
        
        for card in hand {
            if card.card.rawValue == "🂡" || card.card.rawValue == "🂱" || card.card.rawValue == "🃁" || card.card.rawValue == "🃑" {
                numAces += 1
            } else {
                score += card.card.value
            }
        }
        if numAces > 0 {
            score += getRightAce(
                currentScore: score,
                numAces: numAces)
        }
        hand.forEach {
            print($0.card)
        }
        return score
    }
    
    func getRightAce(currentScore: Int, numAces: Int) -> Int {
        let maxBlackJackPoints = 21
        let delta = maxBlackJackPoints - currentScore
        
        let maxAceValue = 11
        let elevanAce = maxAceValue + (numAces - 1)
        
        if elevanAce <= delta {
            return elevanAce
        }
        return numAces
    }
    
//    func getResult() -> Result {
//        let playerScore = getScore(hand: playerHand)
//        print("Player: \(playerScore)")
//
//        let cpuScore = getScore(hand: cpuHand)
//        print("CPU: \(cpuScore)")
//        if playerScore == cpuScore {
//            return .tie
//        } else if playerScore > cpuScore && playerScore <= 21 {
//            return . player(score: playerScore)
//        }
//        return .cpu(score: cpuScore)
//
//    }
    
//    switch result {
//    case .cpu(let score):
//        print("Player won!, Score: \(score)")
//    case .player(let score):
//        print("CPU won!, Score: \(score)")
//    case .tie:
//        print("Tie!")
//    case .previous:
//        break
//    }
    
//    if case Result.previous(let result) = previousResult {
//        print("Previous Result: \(result)")
//    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
