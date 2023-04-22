//
//  ViewController2.swift
//  CalculadoraApp
//
//  Created by Juan Ibargüen on 21/04/2023.
//

import Foundation
import UIKit

class ViewController2: UIViewController {
    

    @IBOutlet weak var containerViews: UIView!
    
    
    
    
    
    
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
        upperView.backgroundColor = .brown
        containerViews.addSubview(upperView)
        //F1F5F8
    }
    
    


}
