//
//  ViewController.swift
//  03-Adivino
//
//  Created by Carlos Daniel Pedrerol on 25/08/2020.
//  Copyright © 2020 Carlos Daniel Pedrerol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    
    @IBOutlet weak var labelAnswer: UILabel!
    
    
    let answersArray = ["Si", "No", "Depende", "Puede ser", "Pregunta otra vez", "Ni lo sueñes!", "JaJaJa!"]
    
    var randomAnswerNumber: Int = 0
    
    let nAnswers : UInt32
    
    required init?(coder aDecoder: NSCoder) {
        nAnswers = UInt32(answersArray.count)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func askButtonPressed(_ sender: Any) {
        
        generateRandomAnswers()
    }
    
    func generateRandomAnswers(){
        self.randomAnswerNumber = Int(arc4random_uniform(nAnswers))
        
        let nameLabelAnswer = answersArray[randomAnswerNumber]
    
        self.labelAnswer.text = nameLabelAnswer
        
        
    }

}





