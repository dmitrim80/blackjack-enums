//
//  CardsViewModel.swift
//  blackjack-enums
//
//  Created by Dmitri Morozov on 6/24/23.
//

import Foundation

class BlackJackViewModel: ObservableObject {
    
    @Published var playerCard1: String = "🂠"
    @Published var playerCard2: String = "🂠"
    @Published var playerCard3: String = "🂠"
    @Published var playerCard4: String = "🂠"
    @Published var playingCardBack: String = "🂠"
    @Published var cpuCard1: String = "🂠"
    @Published var cpuCard2: String = "🂠"
    @Published var scoreText: String = "0"
    @Published var playerScore: Int = 0
    @Published var cpuScore: Int = 0
    @Published var playerHand: [CardModel] = []
    @Published var cpuHand: [CardModel] = []
    @Published var hitCardCount: Int = 0
    @Published var newDeck:[CardModel] = []
    @Published var playerStand: Bool = false
    @Published var cpuFirstCardValue: Int = 0
    
    func makeDeck() -> [CardModel] {
        var deck: [CardModel] = []
       
        for card in Cards.allCases{
                deck.append(.init(card: card))
        }
        deck.shuffle()
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
    
    func playerHandCount(newdeck: inout [CardModel]) -> [CardModel] {
        playerHand.append(newdeck.removeLast())
        playerScore = getScore(hand: playerHand)
        return playerHand
        
//        cpuHand.append(newdeck.removeLast())
//        if let lastCard = cpuHand.last {
//            blackJackViewModel.cpuCard1 = lastCard.card.rawValue
//            } else {
//                return
//            }
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




enum Cards: String, CaseIterable {
    case aceofspades = "🂡"
    case twoofspades = "🂢"
    case threeofspades = "🂣"
    case fourofspades = "🂤"
    case fiveofspades = "🂥"
    case sixofspades = "🂦"
    case sevenofspades = "🂧"
    case eightofspades = "🂨"
    case nineofspades = "🂩"
    case tenofspades = "🂪"
    case jackofspades = "🂫"
    case queenofspades = "🂭"
    case kingofspades = "🂮"

    case aceofhearts = "🂱"
    case twoofhearts = "🂲"
    case threeofhearts = "🂳"
    case fourofhearts = "🂴"
    case fiveofhearts = "🂵"
    case sixofhearts = "🂶"
    case sevenofhearts = "🂷"
    case eightofhearts = "🂸"
    case nineofhearts = "🂹"
    case tenofhearts = "🂺"
    case jackofhearts = "🂻"
    case queenofhearts = "🂽"
    case kingofhearts = "🂾"
   
    case aceofdiamonds = "🃁"
    case twoofdiamonds = "🃂"
    case threeofdiamonds = "🃃"
    case fourofdiamonds = "🃄"
    case fiveofdiamonds = "🃅"
    case sixofdiamonds = "🃆"
    case sevenofdiamonds = "🃇"
    case eightofdiamonds = "🃈"
    case nineofdiamonds = "🃉"
    case tenofdiamonds = "🃊"
    case jackofdiamonds = "🃋"
    case queenofdiamonds = "🃍"
    case kingofdiamonds = "🃎"
    
    case aceofclubs = "🃑"
    case twoofclubs = "🃒"
    case threeofclubs = "🃓"
    case fourofclubs = "🃔"
    case fiveofclubs = "🃕"
    case sixofclubs = "🃖"
    case sevenofclubs = "🃗"
    case eightofclubs = "🃘"
    case nineofclubs = "🃙"
    case tenofclubs = "🃚"
    case jackofclubs = "🃛"
    case queenofclubs = "🃝"
    case kingofclubs = "🃞"
    
    var description: String{
        self.rawValue
    }
    
    var value: Int {
        switch self {
        case .aceofclubs, .aceofhearts, .aceofspades, .aceofdiamonds:
            return 1
        case .twoofclubs, .twoofhearts, .twoofspades, .twoofdiamonds:
            return 2
        case .threeofclubs, .threeofhearts, .threeofspades, .threeofdiamonds:
            return 3
        case .fourofclubs, .fourofhearts, .fourofspades, .fourofdiamonds:
            return 4
        case .fiveofclubs, .fiveofhearts, .fiveofspades, .fiveofdiamonds:
            return 5
        case .sixofclubs, .sixofhearts, .sixofspades, .sixofdiamonds:
            return 6
        case .sevenofclubs, .sevenofhearts, .sevenofspades, .sevenofdiamonds:
            return 7
        case .eightofclubs, .eightofhearts, .eightofspades, .eightofdiamonds:
            return 8
        case .nineofclubs, .nineofhearts, .nineofspades, .nineofdiamonds:
            return 9
        case .tenofclubs, .tenofhearts, .tenofspades, .tenofdiamonds,
                .jackofclubs, .jackofhearts, .jackofspades, .jackofdiamonds,
                .queenofclubs, .queenofhearts, .queenofspades, .queenofdiamonds,
                .kingofclubs, .kingofhearts, .kingofspades, .kingofdiamonds:
            return 10
            
        }
    }
}
