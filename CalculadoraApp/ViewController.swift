//
//  ViewController.swift
//  CalculadoraApp
//
//  Created by Juan Ibargüen on 19/03/2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var displayLabel: UILabel!
    
    var firstNumber: Double = 0
    var operation: String = ""
    var isTypingNumber: Bool = false
    var decimalPoint: Bool = false // Variable que indica si ya se ingresó un punto decimal
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func numberButtonPressed(_ sender: UIButton) {
        let number = String(sender.tag)
        
        if isTypingNumber {
            displayLabel.text = displayLabel.text! + number
        } else {
            displayLabel.text = number
            isTypingNumber = true
        }
    }
    
    @IBAction func decimalButtonPressed(_ sender: UIButton) {
        
        // Evaluamos que el numero en pantalla no contenga ya un "."
        if ((displayLabel.text?.contains(".")) != nil) {
            decimalPoint = false
        } else {
            
            if !decimalPoint {
                displayLabel.text = displayLabel.text! + "."
                decimalPoint = true
                isTypingNumber = true
            }
        }
        
    }
    
    
    @IBAction func operationButton(_ sender: UIButton) {
        operation = String(sender.tag)
        firstNumber = Double(displayLabel.text!)!
        isTypingNumber = false
        decimalPoint = false
    }
    
    
    @IBAction func operatorPlus(_ sender: UIButton) {
        print(type(of: displayLabel.text!))
        var numberDisplay = Double(displayLabel.text!)
        
        if let numberDisplay {
            
            if numberDisplay.truncatingRemainder(dividingBy: 1) == 0 {
                displayLabel.text = ("\(Int(numberDisplay * (-1)))")
                print(("\(Int(numberDisplay * (-1)))"))
            } else {
                displayLabel.text = ("\(String(format: "%.2f", numberDisplay))")
                print(("\(String(format: "%.2f", numberDisplay))"))
            }
            
            
            
        }else {
            print(" No ")
        }
        ///print(numberDisplay)
    }
    
    
    
    @IBAction func operationPercent(_ sender: UIButton) {
        var result = Double(displayLabel.text!)! / 100
        displayLabel.text = String(result)
    }
    
    
    @IBAction func resultButton(_ sender: UIButton) {
        let secondNumber = Double(displayLabel.text!)!
        var result: Double = 0
        
        switch operation {
        
        case "10":
            result = firstNumber - secondNumber
        case "20":
            result = firstNumber + secondNumber
        case "30":
            result = firstNumber * secondNumber
        case "40":
            result = firstNumber / secondNumber
        //case "50":
            //print(" asd ")
            //result = firstNumber * (secondNumber / 100)
            //result = Double(displayLabel.text!)! / 100
            //print(Double(displayLabel.text!)! / 100)
        default:
            break
        }
        
        
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            // El resultado es entero, se muestra sin decimales
            displayLabel.text = ("\(Int(result))")
        } else {
            // El resultado no es entero, se muestra con dos decimales
            displayLabel.text = ("\(String(format: "%.2f", result))")
        }
        
        isTypingNumber = false
        decimalPoint = false
        
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        displayLabel.text = "0"
        isTypingNumber = false
        firstNumber = 0
        operation = ""
        decimalPoint = false
    }
}




