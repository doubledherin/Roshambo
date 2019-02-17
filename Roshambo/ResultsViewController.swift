//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Wendy Dherin on 2/16/19.
//  Copyright © 2019 WendyDherin. All rights reserved.
//

import UIKit

enum Choice: String {
    case Rock = "rock"
    case Paper = "paper"
    case Scissors = "scissors"
    
    static func randomChoice() -> Choice {
        let choices = ["rock", "paper", "scissors"]
        let index = Int(arc4random_uniform(3))
        return Choice(rawValue: choices[index])!
    }
}

class ResultsViewController: UIViewController {

    @IBOutlet private weak var resultsImage: UIImageView!
    @IBOutlet private weak var resultsLabel: UILabel!
    
    var playerChoice: Choice!
    private let opponentChoice: Choice = Choice.randomChoice()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        generateResults()
    }

    private func generateResults() {
        var imageName: String
        var text: String
        let contenders = "\(playerChoice.rawValue) versus \(opponentChoice.rawValue)"
        
        switch (playerChoice!, opponentChoice) {
        case let (playerChoice, opponentChoice) where playerChoice == opponentChoice:
            text = "\(contenders): It's a tie."
            imageName = "tie"
        case (.Rock, .Scissors), (.Scissors, .Paper), (.Paper, .Rock):
            text = "\(contenders): You win!"
            imageName = "\(playerChoice.rawValue)-\(opponentChoice.rawValue)"
        default:
            text = "\(contenders): You lose!"
            imageName = "\(opponentChoice.rawValue)-\(playerChoice.rawValue)"
        }
        
        imageName = imageName.lowercased()
        resultsImage.image = UIImage(named: imageName)
        resultsLabel.text = text
    }
    @IBAction func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }

}
