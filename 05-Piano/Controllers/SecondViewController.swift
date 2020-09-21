//
//  SecondViewController.swift
//  05-Piano
//
//  Created by Carlos Daniel Pedrerol on 10/09/2020.
//  Copyright © 2020 Carlos Daniel Pedrerol. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var labelDb: UILabel!
    
    
    var audioPlayer : AVAudioPlayer!
    
    let audioArray = ["1-XC", "2-XD", "3-XE", "4-XF", "5-XG", "6-XA", "7-XB", "8-XC1"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelDb.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
    }
    
    @IBAction func PlaySound(_ sender: UIButton) {
        let idKey = sender.tag
            let fileName = audioArray[idKey-1]
            print("Tecla pulsada \(fileName) ")
            
            if let soundUrl : URL = Bundle.main.url(forResource: fileName, withExtension: "wav"){
                            
                do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundUrl)
                }
                catch {
                    print(error)
                }
                audioPlayer.play()
                
                audioPlayer.volume = 0.5
                
                audioPlayer.isMeteringEnabled = true
                
                audioPlayer.updateMeters()
                
                labelDb.text = ("\(audioPlayer.averagePower(forChannel: 0))Db")
                
            }
        
    }
    
    @IBAction func sliderVolumeChanged(_ sender: UISlider) {
        
        audioPlayer.volume = Float((sender.value)/10)
        
        print("\(audioPlayer.volume)")
        
        
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
