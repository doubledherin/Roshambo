//
//  PlayViewController.swift
//  Roshambo
//
//  Created by Wendy Dherin on 2/16/19.
//  Copyright © 2019 WendyDherin. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    @IBAction private func playRock(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        controller.playerChoice = getPlayerChoice(sender)
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction private func playPaper(_ sender: UIButton) {
        performSegue(withIdentifier: "playSegue", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playSegue" {
            let controller = segue.destination as! ResultsViewController
            controller.playerChoice = getPlayerChoice(sender as! UIButton)
        }
    }
    
    private func getPlayerChoice(_ sender: UIButton) -> Choice {
        let choice = sender.title(for: .normal)!
        return Choice(rawValue: choice)!
    }

}

