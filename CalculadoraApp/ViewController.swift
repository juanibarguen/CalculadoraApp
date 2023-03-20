//
//  ViewController.swift
//  CalculadoraApp
//
//  Created by Juan Ibargüen on 19/03/2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var buttonAC: UIButton!
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var displayOperationLabel: UILabel!
    
    @IBOutlet weak var buttonResta: UIButton!
    
    @IBOutlet weak var buttonSuma: UIButton!
    
    
    var firstNumber: Double = 0
    var operation: String = ""
    var isTypingNumber: Bool = false
    var decimalPoint: Bool = false // Variable que indica si ya se ingresó un punto decimal
    var numberPress = "0"
    
    var nameOpetarion = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayOperationLabel.text = "0"

    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        let number = String(sender.tag)
        
        if isTypingNumber {
            displayLabel.text = displayLabel.text! + number
           // numberPress = displayLabel.text!
            //print(numberPress)
        } else {
            displayLabel.text = number
            //print(number)
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
    
    enum operationType {
        case suma, resta, multiplicacion, division
    }
    
    @IBAction func operationButton(_ sender: UIButton) {
        operation = String(sender.tag)
        firstNumber = Double(displayLabel.text!)!
        isTypingNumber = false
        decimalPoint = false
        
        // Asignamos el valor ingresado a SubLabel
        var numberMoreOperation = firstNumber
        
        if let buttonTitle = sender.titleLabel?.text {
               print("El nombre del botón es: \(buttonTitle)")
           // displayOperationLabel.text = String("\(numberMoreOperation) \(buttonTitle)")
            displayOperationLabel.text = ("\(Int(numberMoreOperation * (1))) \(buttonTitle)")
        } else {
            print("El boton no tiene titulo")
        }
        
        
        
    }
    
    
    @IBAction func operatorPlus(_ sender: UIButton) {
        let numberDisplay = Double(displayLabel.text!)
        
        if let numberDisplay {
            
            if numberDisplay.truncatingRemainder(dividingBy: 1) == 0 {
                displayLabel.text = ("\(Int(numberDisplay * (-1)))")
                //print(("\(Int(numberDisplay * (-1)))"))
            } else {
                displayLabel.text = ("\(String(format: "%.2f", numberDisplay))")
                //print(("\(String(format: "%.2f", numberDisplay))"))
            }
            
            
            
        }else {
            print(" No ")
        }
        //print(numberDisplay)
    }
    
    
    
    @IBAction func operationPercent(_ sender: UIButton) {
        let result = Double(displayLabel.text!)! / 100
        displayLabel.text = String(result)
    }
    
    
    @IBAction func resultButton(_ sender: UIButton) {
        let secondNumber = Double(displayLabel.text!)!
        var result: Double = 0
        
        
        switch operation {
        
        case "10":
            result = firstNumber - secondNumber
            nameOpetarion = "-"
        case "20":
            result = firstNumber + secondNumber
            nameOpetarion = "+"
        case "30":
            result = firstNumber * secondNumber
            nameOpetarion = "*"
        case "40":
            result = firstNumber / secondNumber
            nameOpetarion = "/"
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




