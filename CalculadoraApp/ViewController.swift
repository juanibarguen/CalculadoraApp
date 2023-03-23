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
    @IBOutlet weak var displaySubLabel: UILabel!
    
    @IBOutlet weak var buttonResta: UIButton!
    
    @IBOutlet weak var buttonSuma: UIButton!
    
    var operating: Bool = false
    var firstNumber: Double = 0
    var operation: String = ""
    var isTypingNumber: Bool = false
    var decimalPoint: Bool = false // Variable que indica si ya se ingresó un punto decimal
    var numberPress = "0"
    
    var nameOpetarion = ""
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displaySubLabel.text = ""
        
        displayLabel.adjustsFontSizeToFitWidth = true
        displayLabel.minimumScaleFactor = 0.5
        displaySubLabel.adjustsFontSizeToFitWidth = true
        displaySubLabel.minimumScaleFactor = 0.5
        
    }
    
    
    private func clearDisplay() {
        buttonAC.setTitle("AC", for: .normal)
        displayLabel.text = "0"
        displaySubLabel.text = ""
        isTypingNumber = false
        firstNumber = 0
        operation = ""
        decimalPoint = false
    }
    
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        buttonAC.setTitle("C", for: .normal)
        let number = String(sender.tag)
        
        if isTypingNumber {
            displayLabel.text = displayLabel.text! + number
        } else {
            displayLabel.text = number
            isTypingNumber = true
        }
        
    }
    
    @IBAction func decimalButtonPressed(_ sender: UIButton) {
            if !decimalPoint {
                displayLabel.text = displayLabel.text! + "."
                decimalPoint = true
                isTypingNumber = true
            }
    }
    

    
    @IBAction func operationButton(_ sender: UIButton) {

        operation = String(sender.tag)
        firstNumber = Double(displayLabel.text!)!
        isTypingNumber = false
        decimalPoint = false
        
        // Asignamos el valor ingresado a SubLabel
        let numberSubLabel = firstNumber
        var operatorSubLabel = ""
        if let buttonTitle = sender.titleLabel?.text {
            
            operatorSubLabel = buttonTitle
            print(operatorSubLabel)
            if numberSubLabel.truncatingRemainder(dividingBy: 1) == 0 {
                displaySubLabel.text = ("\(Int(numberSubLabel * (1)))")
            } else {
                displaySubLabel.text = ("\(String(format: "%.2f", numberSubLabel)) \(buttonTitle)")
            }
        }
        displayLabel.text = "0"
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
            
        }
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
        
        var resTemp = ""
        ///
        if firstNumber.truncatingRemainder(dividingBy: 1) == 0 { // El primero es entero
            if secondNumber.truncatingRemainder(dividingBy: 1) == 0 { // El segundo es entero
                // Los dos son enteros
                resTemp = "\(Int(firstNumber)) \(nameOpetarion) \(Int(secondNumber))"
                displaySubLabel.text = resTemp

            }else { // El primero es estero, el segundo no
                resTemp = ("\(Int(firstNumber)) \(nameOpetarion) \(String(format: "%.2f", secondNumber))")
                displaySubLabel.text = resTemp

            }
        }else { // El primero no es entero
            if secondNumber.truncatingRemainder(dividingBy: 1) == 0 { // El primero no pero el segundo si es entero
                resTemp =  "\(String(format: "%.2f", firstNumber)) \(nameOpetarion) \(Int(secondNumber))"
                displaySubLabel.text = resTemp
                
            }else { // Ninguno de los dos es entero
                resTemp = "\(String(format: "%.2f", firstNumber)) \(nameOpetarion) \(String(format: "%.2f", secondNumber))"
                displaySubLabel.text = resTemp
                
            }
        }
        
        isTypingNumber = false
        decimalPoint = false
        
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        clearDisplay()
    }
    
    
    
}




