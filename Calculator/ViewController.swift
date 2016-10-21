//
//  ViewController.swift
//  Calculator
//
//  Created by admin on 10/20/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var distanceBetweenInputTextFieldAndResultLabel: NSLayoutConstraint!
    @IBOutlet weak var distanceBetweenResultLabelAndMiddleView: NSLayoutConstraint!
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    // variables
    var isTappingNumber : Bool = false
    var isEndOperation : Bool = true
    var fistNumber : Double = 0
    var secondNumber : Double = 0
    var operation : String = ""
    
    var audioClick = AVAudioPlayer()
    var audioUrl = URL(fileURLWithPath: Bundle.main.path(forResource: "click2", ofType: "wav")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        inputTextField.isUserInteractionEnabled = false
        playSound()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        updateConstraints()
    }
    
    func playSound() -> Void {
        do {
            try audioClick = AVAudioPlayer(contentsOf: audioUrl)
        } catch {
            print("Sound Error")
        }
        
        audioClick.prepareToPlay()
    }
    
    func updateConstraints() -> Void {
        let scale = UIScreen.main.bounds.size.height / 667
        
        distanceBetweenResultLabelAndMiddleView.constant = UIScreen.main.bounds.size.height > 480 ? distanceBetweenResultLabelAndMiddleView.constant * scale : distanceBetweenResultLabelAndMiddleView.constant * 0.1
        
        distanceBetweenInputTextFieldAndResultLabel.constant = UIScreen.main.bounds.size.height > 480 ? distanceBetweenInputTextFieldAndResultLabel.constant * scale : distanceBetweenInputTextFieldAndResultLabel.constant * 0.1
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Action
    
    @IBAction func numberAction(_ sender: UIButton) {
        let number = sender.currentTitle
        if isTappingNumber {
            if (inputTextField.text?.characters.index(of: ".")) != nil {
                if number == "." {
                    inputTextField.text = inputTextField.text!
                } else {
                    inputTextField.text = inputTextField.text! + number!
                }
            } else {
                inputTextField.text = inputTextField.text! + number!
            }
        } else {
           inputTextField.text = number
            isTappingNumber = true
        }
        
        audioClick.play()
    }
    
    @IBAction func operationAction(_ sender: UIButton) {
        
        operation = sender.currentTitle!
        
        if let inputOperation = Double(inputTextField.text!) {
            if isEndOperation {
                fistNumber = inputOperation
                isEndOperation = false
            } else {
                fistNumber = Double(resultLabel.text!)!
                inputTextField.text = "\(fistNumber)"
            }
            
        } else {
            print("Ban nhap so vao truoc khi thuc hien")
        }
        
        isTappingNumber = false
        
        if operation == "%" {
            equalAction(sender)
        } else if operation == "+/-" {
            equalAction(sender)
        }
    }
    
    @IBAction func equalAction(_ sender: UIButton) {
        isTappingNumber = false
        
        var result : Double = 0
        
        if let realSecondNumber = Double(inputTextField.text!) {
            secondNumber = realSecondNumber
        }
        if operation == "" {
            if Double(inputTextField.text!) != nil {
                    result = Double(inputTextField.text!)!
            }
        } else {
            switch operation {
                case "+":
                    result = fistNumber + secondNumber
                case "-":
                    result = fistNumber - secondNumber
                case "*":
                    result = fistNumber * secondNumber
                case "/":
                    if secondNumber == 0 {
                        print("Error Operation")
                    } else {
                        result = fistNumber / secondNumber
                    }
                
                case "%":
                    result = fistNumber / 100
                case "+/-":
                    if fistNumber < 0 {
                        fistNumber = fabs(fistNumber)
                        result = fistNumber
                    } else {
                        fistNumber = -1 * fistNumber
                        result = fistNumber
                    }
                    inputTextField.text = "\(result)"
                default:
                    print("Error Operation")

            }
        }
        resultLabel.text = "\(result)"
        audioClick.play()
    }
    
    @IBAction func acAction(_ sender: UIButton) {
        fistNumber = 0
        secondNumber = 0
        inputTextField.text = ""
        resultLabel.text = "0"
        isEndOperation = true
    }
    
    


}

