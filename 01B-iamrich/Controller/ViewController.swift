//
//  ViewController.swift
//  01B-iamrich
//
//  Created by Carlos Daniel Pedrerol on 18/08/2020.
//  Copyright © 2020 Carlos Daniel Pedrerol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Properties
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var imageIcon: UIImageView!

    @IBOutlet weak var buttonPush: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
//Methods
    
    @IBAction func buttonPressed(_ sender: UIButton) {
       let controller = UIAlertController(title: "I am Rich", message: """
                Dani es rico, guapo y gran jugador.
                Por eso le envidias
                """, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Verdad!", style: .cancel) { (action) in
            print("Sabias palabras!")
        }
        
        controller.addAction(action)
        
        let action2 = UIAlertAction(title: "Aceptar", style: .default, handler: { (action) in
            print("He pulsado el botón Aceptar.")
        })

        controller.addAction(action2)
        
        let action3 = UIAlertAction(title: "Borrar", style: .destructive) { _ in
            print("He pulsado el botón de Borrar.")
        }

        controller.addAction(action3)
        
        self.show(controller, sender: nil)
        
        
        
        
        
        
    }
    
    
    
}

