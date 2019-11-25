//
//  ViewController.swift
//  BullEyes
//
//  Created by Vinh Le on 11/21/19.
//  Copyright © 2019 Vinh Le. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var currentValue = 50
    var targetValue = 0
    var gainedScore = 0
    var score = 0
    var round = 1
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.startNewRound()
    }

    @IBAction func showAlert() {
        self.updateScore()
        self.updateRoute()
        
        let message: String = "You gained \(gainedScore) points"
        let title: String = self.getAlertTitle()
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        self.startNewRound()
    }
    
    @IBAction func moveSlider(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func getAlertTitle() -> String {
        let diff = 100 - gainedScore
        let title: String
        
        if diff == 0 {
            title = "Perfect"
        } else if diff < 10 {
            title = "Very close"
        } else {
            title = "More improvements"
        }
        
        return title
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func updateScore() {
        let diff = abs(currentValue - targetValue)
        gainedScore = 100 - diff
        score += gainedScore
    }
    
    func updateRoute() {
        round += 1
    }
}

