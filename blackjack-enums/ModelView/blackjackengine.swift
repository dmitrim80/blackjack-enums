//
//  blackjackengine.swift
//  blackjack-enums
//
//  Created by Dmitri Morozov on 6/17/23.
//

import Foundation

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

enum Result {
    case player(score: Int)
    case cpu(score: Int)
    case tie
    indirect case previous(Result)
}






 
