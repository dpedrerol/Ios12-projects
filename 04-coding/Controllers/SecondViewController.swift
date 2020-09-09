//
//  SecondViewController.swift
//  04-coding
//
//  Created by Carlos Daniel Pedrerol on 27/08/2020.
//  Copyright © 2020 Carlos Daniel Pedrerol. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var labelNumber: UILabel!
    
    @IBOutlet weak var labelGoldNum: UILabel!
    
    @IBOutlet weak var textViewResult: UITextView!
    
    @IBOutlet weak var stepper: UIStepper!
    
    var fibonacci: [Int] = [0,1]
    
    var fibId = 1
    
    var wantsGoldNum = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
        updateLabel(id: Int(self.stepper.value))
    }

    
    func generateFibNumbers(){
        
       /* if(fibId<=1||fibId>100){
            
            return
            
        }*/
        // Generar números fib hasta fibId
        fibonacci = [0,1]
        
        for i in 2...fibId {
            fibonacci.append(fibonacci[i-1]+fibonacci[i-2])
       
        }
        
        let fibStr : [String] = fibonacci.compactMap({ String($0)})
        let result : String = fibStr.joined(separator: "\n")
        self.textViewResult.text = result
    }

    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        
        updateLabel(id: Int(sender.value))
    }
    
    func updateLabel(id: Int){
        self.fibId = id
        self.labelNumber.text = "\(self.fibId)"
        generateFibNumbers()
        calculateGoldNum()
    }
    
    @IBAction func switchMoved(_ sender: UISwitch) {
        self.wantsGoldNum = sender.isOn
        
    }
    func calculateGoldNum() {
        if self.wantsGoldNum {
            //Generar el número de oro cociente entre los dos últimos de fibonacci
            let last = Double(fibonacci[fibonacci.count-1])
            let previous = Double(fibonacci[fibonacci.count-2])
            let goldNum = last / previous
            self.labelGoldNum.text = "\(goldNum)"
            
            
        }else {
            //Texto por defecto
            self.labelGoldNum.text = "Ver número áureo"
        }
        
    }
    
    
}

