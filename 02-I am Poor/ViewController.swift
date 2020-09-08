//
//  ViewController.swift
//  02-I am Poor
//
//  Created by Carlos Daniel Pedrerol on 19/08/2020.
//  Copyright © 2020 Carlos Daniel Pedrerol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelTitle: UILabel!

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var buttonOn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonOn(_ sender: UIButton) {
        labelTitle.text = "Soy Rico"
        imageView.image = UIImage(named: "ruby-image.png")
        
        let controller = UIAlertController(title: "Eres Rico!", message: """
                Quieres ver lo que te depara el destino?
                """, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Aceptar", style: .cancel) { (action) in
            self.labelTitle.text = "Soy Pobre"
            self.imageView.image = UIImage(named: "Banana.png")        }
        
        controller.addAction(action)
        
        self.show(controller, sender: nil)
        
    
    }
    

}

