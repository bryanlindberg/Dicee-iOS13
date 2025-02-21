//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var diceImageViewPlaceholder: UIImageView! //hidden image to be used as placeholder for swap
    @IBOutlet weak var rollCounterLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var bonusRollLabel: UILabel!
    var leftDiceNumber = 1
    var rightDiceNumber = 5
    var rollCount = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bonusRollLabel.isHidden = true
        rollCounterLabel.text = "Roll Count: \(rollCount)" //If this isn't added, the label will show as "Label" on startup
        diceImageView1.image = #imageLiteral(resourceName: "DiceSix")
        diceImageView2.image = #imageLiteral(resourceName: "DiceTwo")
        score = (leftDiceNumber + 1) + (rightDiceNumber + 1)
        scoreLabel.text = "\(score)"
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
        let randomNum1 = Int.random(in: 0...5)
        let randomNum2 = Int.random(in: 0...5)
        
        bonusRollLabel.isHidden = true
        diceImageView1.image = diceArray[randomNum1]
        if diceImageView1.image == diceArray[5] && diceImageView2.image == diceArray[5] {
            diceImageView1.image = diceArray[4] //The house edge - if BOTH dice roll a 6, the left die will be set to 5.
        }
        diceImageView2.image = diceArray[randomNum2]
        rollCount += 1 //Roll counter keeps track of how many times "Roll" has been pressed
        rollCounterLabel.text = "Roll Count: \(rollCount)"
        score = (randomNum1 + 1) + (randomNum2 + 1)
        if rollCount % 5 == 0 {
            bonusRollLabel.isHidden = false
            bonusRollLabel.text = "\(rollCount)th roll! 2 bonus points!"
            score += 2 // adds 2 bonus points every 5th roll
        }
        scoreLabel.text = "Your score: \(score)"
        
        
    }
    
    @IBAction func maxRollButtonPressed(_ sender: UIButton) {
        let maxRollScore = 12
        diceImageView1.image = #imageLiteral(resourceName: "DiceSix")
        diceImageView2.image = #imageLiteral(resourceName: "DiceSix")
        scoreLabel.text = "Your score: \(maxRollScore)"
        
    }
    
    @IBAction func switcharooButtonPressed(_ sender: UIButton) {
        diceImageViewPlaceholder.image = diceImageView1.image
        diceImageView1.image = diceImageView2.image
        diceImageView2.image = diceImageViewPlaceholder.image
    }
    
    
    
}

