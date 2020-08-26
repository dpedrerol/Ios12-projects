//
//  ViewController.swift
//  03-Adivino
//
//  Created by Carlos Daniel Pedrerol on 25/08/2020.
//  Copyright © 2020 Carlos Daniel Pedrerol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    
    @IBOutlet weak var imageAnswer: UIImageView!
    
    
    
    let answersArray = ["yes", "no", "maybe", "never", "what"]
    
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
        
        let nameImageAnswer = answersArray[randomAnswerNumber]
    
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: UIView.AnimationOptions.curveEaseOut,
                       animations: {
         
                        self.imageAnswer.transform = CGAffineTransform(scaleX: 0.5, y: 0.5).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2)).concatenating(CGAffineTransform(translationX: -100, y: 100))
        
        
        
        }){(completed) in
        
            self.imageAnswer.transform = CGAffineTransform.identity
            self.imageAnswer.image = UIImage(named: nameImageAnswer)

        }
        
    }
    
    override func becomeFirstResponder() -> Bool {
           return true

    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        if motion == .motionShake{
            generateRandomAnswers()
        }
        
        
    }



}
