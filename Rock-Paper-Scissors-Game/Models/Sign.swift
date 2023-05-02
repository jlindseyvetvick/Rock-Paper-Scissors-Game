//
//  Sign.swift
//  Rock-Paper-Scissors-Game
//
//  Created by Lindsey Vetvick on 5/1/23.
//
// next we are going to create UI in Main -- need to change button style to default to change font size

import Foundation

func randomSign () -> Sign {
    let sign = Int.random(in: 0...2)
    
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    
    case rock, paper, scissors

    var emoji: String {
        switch self {
        case .rock:
            return "🪨"

        case .paper:
            return "🗞️"
            
        case .scissors:
                return "✂️"
        }
    }
    
}


