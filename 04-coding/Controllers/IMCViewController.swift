//
//  IMCViewController.swift
//  04-coding
//
//  Created by Carlos Daniel Pedrerol on 07/09/2020.
//  Copyright © 2020 Carlos Daniel Pedrerol. All rights reserved.
//

import UIKit

class IMCViewController: UIViewController {
    
    @IBOutlet weak var sliderWeight: UISlider!
    
    @IBOutlet weak var labelWeight: UILabel!
    
    @IBOutlet weak var sliderHeight: UISlider!
    
    @IBOutlet weak var labelHeight: UILabel!
    
    @IBOutlet weak var labelIMC: UILabel!
    
    var userWeight = 0
    
    var userHeight = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func slideWeightMoved(_ sender: UISlider) {

    updateWeightLabel()
    
    }
    
    func updateWeightLabel() {
    
     self.userWeight = Int(self.sliderWeight.value)
        
     self.labelWeight.text = "\(self.userWeight)"
        
    }
    
    
    @IBAction func slideHeightMoved(_ sender: UISlider) {
    
    updateHeightLabel()
        
    }
    
    
    func updateHeightLabel() {
    
     self.userHeight = Int(self.sliderHeight.value)
    
     self.labelHeight.text = "\(self.userHeight)"
        
    }
    
    @IBAction func buttomValidate(_ sender: UIButton) {
        
        let floatUserWeight = Float(self.userWeight)
        let floatUserHeight = Float(self.userHeight)
        
        let iMC = (floatUserWeight) / ((floatUserHeight * floatUserHeight)/10000)
        
        if iMC < 18.5 {
            labelIMC.text = "Tu IMC es \(iMC) \r Tienes bajo peso"
        } else if iMC >= 18.5 && iMC <= 24.99 {
            labelIMC.text = "Tu IMC es \(iMC) \r Tienes peso normal"
        } else if iMC > 24.99 && iMC <= 30.0 {
            labelIMC.text = "Tu IMC \(iMC) \r Tienes sobrepeso"
        } else {
            labelIMC.text = "Tu IMC \(iMC) \r Tienes obesidad"
                    }
                
            }
           
        


        

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
