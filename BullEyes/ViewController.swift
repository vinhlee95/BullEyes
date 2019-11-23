//
//  ViewController.swift
//  BullEyes
//
//  Created by Vinh Le on 11/21/19.
//  Copyright © 2019 Vinh Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 50
    var targetValue: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        
        self.startNewRound()
    }

    @IBAction func showAlert() {
        let message: String = "Move to \(currentValue)" +
        "\n The target value is \(targetLabel.text!)"
        
        let alert = UIAlertController(title: "Slider", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        self.startNewRound()
    }
    
    @IBAction func moveSlider(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        print("Current value is \(roundedValue)")
        currentValue = Int(roundedValue)
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabel()
    }
    
    func updateLabel() {
        targetLabel.text = String(targetValue)
    }
}

