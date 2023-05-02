//
//  GameState.swift
//  Rock-Paper-Scissors-Game
//
//  Created by Lindsey Vetvick on 5/1/23.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    
    var status: String{
        switch self {
        case .start:
            return "Let's Play!"
            
        case .win:
            return "You got the W!🏆"
        
        case .lose:
            return "Big L, my friend. ❌"
            
        case .draw:
            return "It's a draw."
            
        }
    }
    
}
