//
//  ViewController.swift
//  CalculadoraApp
//
//  Created by Juan Ibargüen on 19/03/2023.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var displaySubLabel: UILabel!
    
    @IBOutlet weak var buttonAC: UIButton!
    
    @IBOutlet weak var buttonResultado: UIButton!
    
    @IBOutlet weak var buttonResta: UIButton!
    
    @IBOutlet weak var buttonSuma: UIButton!
    
    @IBOutlet weak var buttonMultiplicacion: UIButton!
    
    @IBOutlet weak var buttonDivision: UIButton!
    
    @IBOutlet weak var buttonPorcentaje: UIButton!
    
    @IBOutlet weak var buttonPlus: UIButton!
    
    // Numbers
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var buttonComa: UIButton!
    
    var operating: Bool = false
    var firstNumber: Double = 0
    var operation: String = ""
    var isTypingNumber: Bool = false
    var decimalPoint: Bool = false // Variable que indica si ya se ingresó un punto decimal
    var numberPress = "0"
    var nameOpetarion = ""
    
    // Asignamos colores en variables
        let numbersBackground = [UIColor(named: "numbersBackground")?.resolvedColor(with: UITraitCollection(userInterfaceStyle: .dark))]
        let operatorsBackground = [UIColor(named: "operatorsBackground")?.resolvedColor(with: UITraitCollection(userInterfaceStyle: .dark))]
        let textLabelColor = [UIColor(named: "textLabelColor")?.resolvedColor(with: UITraitCollection(userInterfaceStyle: .dark))]
        let textNumbers = [UIColor(named: "textNumbers")?.resolvedColor(with: UITraitCollection(userInterfaceStyle: .dark))]
        let textOperations = [UIColor(named: "textOperations")?.resolvedColor(with: UITraitCollection(userInterfaceStyle: .dark))]
        let textSubLabelColor = [UIColor(named: "textSubLabelColor")?.resolvedColor(with: UITraitCollection(userInterfaceStyle: .dark))]
        let viewButtonBackground = [UIColor(named: "viewButtonBackground")?.resolvedColor(with: UITraitCollection(userInterfaceStyle: .dark))]
        let viewTopBackground = [UIColor(named: "viewTopBackground")?.resolvedColor(with: UITraitCollection(userInterfaceStyle: .dark))]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewWidth = self.view.frame.size.width * 2

        // Crear la vista
        let upperView = UIView(frame: CGRect(x: -185, y: -50, width: viewWidth, height: 450))
        upperView.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)

        // Crear la forma ovalada
        let ovalPath = UIBezierPath(ovalIn: upperView.bounds)

        // Crear la máscara de la capa
        let maskLayer = CAShapeLayer()
        maskLayer.path = ovalPath.cgPath
        upperView.layer.mask = maskLayer
    
        // Agregarmos el color original + = UIColor(named: "viewTopBackground")
        upperView.backgroundColor = UIColor(named: "viewTopBackground")
        view.addSubview(upperView)
        
        // Mover la vistaInferior al frente (por encima de la vistaSuperior)
        self.view.bringSubviewToFront(displayLabel)

 
        displaySubLabel.text = ""
        displayLabel.adjustsFontSizeToFitWidth = true
        displayLabel.minimumScaleFactor = 0.5
        displaySubLabel.adjustsFontSizeToFitWidth = true
        displaySubLabel.minimumScaleFactor = 0.5

    }
    
    private func setMode() {
        if self.traitCollection.userInterfaceStyle == .dark {
            // el modo oscuro está activado
            print("el modo oscuro está activado")
        } else {
            // el modo claro está activado
            print("el modo claro está activado")
        }
    }
    
    // Limpiar resultado
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
        //var operatorSubLabel = ""
        if let buttonTitle = sender.titleLabel?.text {
            
            //operatorSubLabel = buttonTitle
            //print(operatorSubLabel)
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
            } else {
                displayLabel.text = ("\(String(format: "%.2f", numberDisplay))")
            }
        }
    }
    
    @IBAction func operationPercent(_ sender: UIButton) {
        if (operation == ""){
            let result = Double(displayLabel.text!)! / 100
            displayLabel.text = String(result)
        }else {
            displayLabel.text = String(firstNumber / 100)
        }
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
            nameOpetarion = "×"
        case "40":
            result = firstNumber / secondNumber
            nameOpetarion = "÷"
        default:
            break
        }
        
        
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            // El resultado es entero: se muestra sin decimales
            displayLabel.text = ("\(Int(result))")
        } else {
            // El resultado no es entero: se muestra con dos decimales
            displayLabel.text = ("\(String(format: "%.2f", result))")
        }
        
        var resTemp = ""
        
        if firstNumber.truncatingRemainder(dividingBy: 1) == 0 { // El primero es entero
            if secondNumber.truncatingRemainder(dividingBy: 1) == 0 { // El segundo es entero
                // Los dos son enteros
                resTemp = "\(Int(firstNumber))  \(nameOpetarion)  \(Int(secondNumber))"
                displaySubLabel.text = resTemp

            }else { // El primero es estero, el segundo no
                resTemp = ("\(Int(firstNumber))  \(nameOpetarion)  \(String(format: "%.2f", secondNumber))")
                displaySubLabel.text = resTemp

            }
        }else { // El primero no es entero
            if secondNumber.truncatingRemainder(dividingBy: 1) == 0 { // El primero no pero el segundo si es entero
                resTemp =  "\(String(format: "%.2f", firstNumber))  \(nameOpetarion)  \(Int(secondNumber))"
                displaySubLabel.text = resTemp
                
            }else { // Ninguno de los dos es entero
                resTemp = "\(String(format: "%.2f", firstNumber))  \(nameOpetarion)  \(String(format: "%.2f", secondNumber))"
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




