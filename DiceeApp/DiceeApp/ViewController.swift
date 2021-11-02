//
//  ViewController.swift
//  DiceeApp
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var numberOfRounds: Int = 5
    private var playerOneChance: Bool = true
    private var diceImages: Dictionary = [1:#imageLiteral(resourceName: "Dice1"), 2:#imageLiteral(resourceName: "Dice2"), 3:#imageLiteral(resourceName: "Dice3"), 4:#imageLiteral(resourceName: "Dice4"), 5:#imageLiteral(resourceName: "Dice5"), 6:#imageLiteral(resourceName: "Dice6")]
    
    // IBOutlet allows me to reference a UI element
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var playerOneValue: UILabel!
    @IBOutlet weak var playerTwoValue: UILabel!
    @IBOutlet weak var noOfRoundsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Using Image Literal
        // Type Image Literal
        // Then it will give an icon in the code
        // Then double click on that icon and select the appropriate image
        // WHO.WHAT = VALUE
        // diceImageView1.image = #imageLiteral(resourceName: "Dice1")
        // diceImageView2.image = #imageLiteral(resourceName: "Dice1")
        setViewAsChance()
    }
    
    func setViewAsChance() {
        if playerOneChance {
            diceImageView1.alpha = 1
            diceImageView2.alpha = 0.5
        }
        else {
            diceImageView1.alpha = 0.5
            diceImageView2.alpha = 1
        }
    }
    
    func showRollingAnimation() {
        if playerOneChance {
            UIView.animate(withDuration: 1, animations: { [self] in
                diceImageView1.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                diceImageView1.transform = CGAffineTransform(rotationAngle: 0)
            })
        }
        else {
            UIView.animate(withDuration: 1, animations: { [self] in
                diceImageView2.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                diceImageView2.transform = CGAffineTransform(rotationAngle: 0)
            })
        }
    }
    
    @IBAction func rollBtnClicked(_ sender: UIButton) {
        print("Roll button is clicked")
        let number = Int.random(in: 1...6)
        showRollingAnimation()
        if playerOneChance {
//            diceImageView1.image = UIImage(named: "Dice\(number)")
            let oldValue:Int? = Int(playerOneValue.text ?? "0")
            playerOneValue.text = String(number + oldValue!)
            diceImageView1.image = diceImages[number]
        }
        else {
//            diceImageView2.image = UIImage(named: "Dice\(number)")
            let oldValue:Int? = Int(playerTwoValue.text ?? "0")
            playerTwoValue.text = String(number + oldValue!)
            diceImageView2.image = diceImages[number]
            numberOfRounds -= 1
            noOfRoundsLabel.text = "No. of Rounds: \(numberOfRounds)"
            if numberOfRounds == 0 {
                var winnerMessage:String?
                let playerOneFinalScore = Int(playerOneValue.text ?? "0")
                let playerTwoFinalScore = Int(playerTwoValue.text ?? "0")
                if (playerOneFinalScore! > playerTwoFinalScore!) {
                    winnerMessage = "Player 01 Wins"
                }
                else if (playerOneFinalScore! < playerTwoFinalScore!) {
                    winnerMessage = "Player 02 Wins"
                }
                showWinnerAlert(message: (winnerMessage ?? "Game is drawn"))
            }
        }
        playerOneChance = !playerOneChance
        setViewAsChance()
    }

    func showWinnerAlert(message: String) {
        let alert = UIAlertController(title: "Winner", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "New Game", style: .default, handler: {_ in
            self.playerOneValue.text = "0"
            self.playerTwoValue.text = "0"
            self.numberOfRounds = 5
            self.noOfRoundsLabel.text = "No. of Rounds: \(self.numberOfRounds)"
        }))
        self.present(alert, animated: true, completion: nil)
    }

}

