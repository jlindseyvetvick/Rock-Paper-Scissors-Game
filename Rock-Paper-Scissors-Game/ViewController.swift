//
//  ViewController.swift
//  Rock-Paper-Scissors-Game
//
//  Created by Lindsey Vetvick on 5/1/23.
//  Link to Brian's BlogPost about Rock-Paper-Scissors-Lizard-Spock:
// https://www.swiftteacher.org/swift-teacher/2021/4/20/lizard-spock-addition-conundrum


import UIKit

class ViewController: UIViewController {

    
    //MARK: - IB Outlets
    @IBOutlet weak var computerSignLabel: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    //MARK: - Instance Properties
    

    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(forState: .start)    }

    //MARK: - IB Actions
    @IBAction func rockButtonChosen(_ sender: UIButton) {
        playTheGame(userSign: .rock)
    }
    
    @IBAction func paperButtonChosen(_ sender: UIButton) {
        playTheGame(userSign: .paper)
    }
    
    @IBAction func scissorsButtonChosen(_ sender: UIButton) {
        playTheGame(userSign: .scissors)
    }
    
    @IBAction func playAgainButtonTapped(_ sender: UIButton) {
        updateUI(forState: .start)
    }
    
    
    
    //MARK: - Instance Methods

    func updateUI(forState state: GameState) {
        gameStatus.text = state.status
        
        switch state{
        case .start:
            view.backgroundColor = .white
            
            computerSignLabel.text = "👀"
            playAgainButton.isHidden = true
            
            rockButton.isHidden = false
            paperButton.isHidden = false
            scissorsButton.isHidden = false
            
            rockButton.isEnabled = true
            paperButton.isEnabled = true
            scissorsButton.isEnabled = true
         
        case .win:
            view.backgroundColor = UIColor(red: (100/255), green: (215/255), blue: (85/255), alpha: 1)
            //view.backgroundColor = UIColor(red: 0.651, green: 0.792, blue: 0.651, alpha: 1)
            //view.backgroundColor = .green
            
        case .lose:
            view.backgroundColor = .red
            ///view.backgroundColor = UIColor(red: 0.851, green: 0.424, blue: 0.412, alpha: 1)
            
        case .draw:
            //view.backgroundColor = .yellow
            view.backgroundColor = UIColor(red: (18/255), green: (38/255), blue: (102/255), alpha: 1)

        }
    
    }
    
    // have students build & run - then ask "why didn't the UI update from the generic layout that was built in IB? what we want them to discover is that the method [updateUI] has not yet been called in the VDL, which fires every time the app starts
    
    //method to play the game - it will generate a random sign for the computer, compare the selected signs, update the UI, hide & disable RPS buttons, and show the "Play Again" button
    
    func playTheGame(userSign: Sign){
        let computerSign = randomSign()
        let gameState = userSign.gameState(against: computerSign)
        updateUI(forState: gameState)
        
        computerSignLabel.text = computerSign.emoji
        
        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorsButton.isHidden = true
        
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        
        switch userSign {
        case .rock:
            rockButton.isHidden = false
            
        case .paper:
            paperButton.isHidden = false
            
        case .scissors:
            scissorsButton.isHidden = false
        }
        
        playAgainButton.isHidden = false
        
        
    }
}

