//
//  ViewController.swift
//  Mathtions
//
//  Created by xdrond on 11.04.2020.
//  Copyright © 2020 xdrond. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    @IBOutlet weak var checkButtonStyle: UIButton!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var expressionLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet var numButtonsStyle: [UIButton]!
    
    var wins: UInt = 0
    
    @IBAction func numButtonsHandler(_ pressButton: UIButton) {
        answerLabel.text?.append(pressButton.currentTitle!)
    }
    
    @IBAction func minusButtonHandler(_ pressButton: UIButton) {
        let firstSym = answerLabel.text!.first
        if firstSym != nil{
            if firstSym! == "-"{
                answerLabel.text!.removeFirst()
            }
            else{
                answerLabel.text!.insert("-", at: answerLabel.text!.startIndex)
            }
        }
    }
    
    @IBAction func deleteButtonHandler(_ pressButton: UIButton) {
        if !answerLabel.text!.isEmpty {
            answerLabel.text?.removeLast()
        }
    }
    
    @IBAction func checkButtonHandler(_ sender: UIButton) {
        if Int(answerLabel.text!) == expressionByApp.correctAnswer {
            wins += 1
            winsLabel.text? = String(wins)
            answerLabel.text!.removeAll()
            expressionByApp.update()
            expressionLabel.text = expressionByApp.expression
        }
        else{
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkButtonStyle.layer.cornerRadius = checkButtonStyle.frame.height / 2
        answerLabel.text = ""
        expressionLabel.text = expressionByApp.expression
        for button in numButtonsStyle{
            button.layer.cornerRadius = button.frame.height / 2
        }
    }
    
}

