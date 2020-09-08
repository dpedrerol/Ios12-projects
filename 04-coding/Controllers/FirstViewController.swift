//
//  FirstViewController.swift
//  04-coding
//
//  Created by Carlos Daniel Pedrerol on 27/08/2020.
//  Copyright © 2020 Carlos Daniel Pedrerol. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    
    
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var sliderAge: UISlider!
    
    var userAge = 0
    var userName = ""
    //var userMoney = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateAgeLabel()
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //Cerramos el teclado
        textField.resignFirstResponder()
        
        print("Hemos pulsado la tecla enter en un textfield")
        
        // Recuperamos el contenido del textfield si existe
        if let theText = textField.text {
            print(theText)
            self.userName = theText
            
            
            
        }
        //Indicamos la finalización de la edición del textfield
        return true
    }
    
    
    @IBAction func sliderAgeMoved(_ sender: UISlider) {
        
        self.updateAgeLabel()
    
    }
    
    func updateAgeLabel() {
       
        self.userAge = Int(self.sliderAge.value)
        
        self.labelAge.text = "\(self.userAge)"
        
    }
    
    @IBAction func validateData(_ sender: UIButton) {
        
       let shouldEnterTheParty = (userName == "Marulo") || (userAge >= 18)
        
        if shouldEnterTheParty {
            print("Bienvenido a la fiesta")
            self.view.backgroundColor = UIColor(displayP3Red: 49.0/255.0, green: 237.0/255.0, blue: 93.0/255.0, alpha: 0.7)
        }else{
            print("Lo siento, es una fiesta privada")
            self.view.backgroundColor = UIColor(displayP3Red: 250.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 0.8)
        }
        /*if userName == "Marulo" {
            print("Puedes entrar a la fiesta Marulo")
            self.view.backgroundColor = UIColor(displayP3Red: 49.0/255.0, green: 237.0/255.0, blue: 93.0/255.0, alpha: 0.7)
        } else {
            if userAge >= 21 {
                print("Puedes entrar a la fiesta, eres mayor de edad")
                self.view.backgroundColor = UIColor(displayP3Red: 50.0/255.0, green: 160.0/255.0, blue: 250.0/255.0, alpha: 0.7)
            } else {
                print("Lo siento, esta fiesta es privada")
                self.view.backgroundColor = UIColor(displayP3Red: 250.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 0.8)
            }*/
        
        
        
    }

}
