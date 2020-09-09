//
//  ViewController.swift
//  02-dices
//
//  Created by Carlos Daniel Pedrerol on 20/08/2020.
//  Copyright © 2020 Carlos Daniel Pedrerol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageViewDiceLeft: UIImageView!
    
    @IBOutlet weak var imageViewDiceRight: UIImageView!
    
    @IBOutlet weak var sumDiceLabel: UILabel!
    
    
    var randomDiceIndexLeft : Int = 0
    
    var randomDiceIndexRight: Int = 0
    
    var sumDicePos: UInt32 = 0
    
    let diceImages = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    let nFaces : UInt32
    
    required init?(coder aDecoder: NSCoder) {
        nFaces = UInt32(diceImages.count)
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func rollPressed(_ sender: Any) {
        generateRandomDices()
    }
    
    
    func generateRandomDices(){
        randomDiceIndexLeft = Int(arc4random_uniform(nFaces))
        
        randomDiceIndexRight = Int(arc4random_uniform(nFaces))
        
        let nameImageDiceLeft = diceImages[randomDiceIndexLeft]
        
        let nameImageDiceRight = diceImages[randomDiceIndexRight]
        
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: UIView.AnimationOptions.curveEaseOut,
                       animations: {
                        
                        self.imageViewDiceLeft.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2)).concatenating(CGAffineTransform(translationX: -100, y: 100))
                        
                        
                        self.imageViewDiceRight.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2)).concatenating(CGAffineTransform(translationX: 100, y: 100))
                        
                        self.imageViewDiceLeft.alpha = 0.0
                        self.imageViewDiceRight.alpha = 0.0
                        
                        
        }){(completed) in
            
            self.imageViewDiceLeft.transform = CGAffineTransform.identity
            self.imageViewDiceRight.transform = CGAffineTransform.identity
            
            self.imageViewDiceLeft.alpha = 1.0
            self.imageViewDiceRight.alpha = 1.0
            
            self.imageViewDiceLeft.image = UIImage(named: nameImageDiceLeft)
            self.imageViewDiceRight.image = UIImage(named: nameImageDiceRight)
            
        }
        
        self.sumDicePos =  UInt32(randomDiceIndexLeft + randomDiceIndexRight + 2)
        
        self.sumDiceLabel.text = String("Suma: ") + String(sumDicePos)
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        if motion == .motionShake{
            generateRandomDices()
        }
        
        
        
    }
    
   
    
    
    
}

