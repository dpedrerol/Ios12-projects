//
//  FontDetailViewController.swift
//  04-coding
//
//  Created by Carlos Daniel Pedrerol on 07/09/2020.
//  Copyright © 2020 Carlos Daniel Pedrerol. All rights reserved.
//

import UIKit

class FontDetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var pickerFonts: UIPickerView!
    
    @IBOutlet weak var textView: UITextView!
    
    var familyName: String = ""
    
    var fonts : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.labelTitle.text = familyName
        self.labelTitle.font = UIFont(name: familyName, size: 19.0)
        
        self.pickerFonts.dataSource = self
        self.pickerFonts.delegate = self
        
        self.textView.font = UIFont(name: familyName, size: 14.0)
        
        if fonts.count == 0 {
            self.pickerFonts.isHidden = true
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true)
    }
   
    //MARK: - Métodos UIPickerviewDataSource
        
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
       
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.fonts.count
       }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fonts[row]
    }
    //MARK: - Método de UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let font = fonts[row]
        self.textView.font = UIFont(name: font, size: 14.0)
    }
    
    
}
