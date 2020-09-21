//
//  ViewController.swift
//  05-Piano
//
//  Created by Carlos Daniel Pedrerol on 08/09/2020.
//  Copyright © 2020 Carlos Daniel Pedrerol. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var sliderVolume: UISlider!
    
    @IBOutlet weak var labelDb: UILabel!
    
    var audioPlayer : AVAudioPlayer!
    
    let soundsArray = ["1-A", "2-Bb", "3-B", "4-C", "5-Db", "6-D", "7-Eb", "8-E", "9-F", "10-Gb", "11-G", "12-Ab", "13-A1"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*sliderVolume.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))*/
        labelDb.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
        
    }

    
    @IBAction func playSound(_ sender: UIButton) {
        let idKey = sender.tag
        let fileName = soundsArray[idKey-1]
        print("Tecla pulsada \(fileName) ")
        
        if let soundUrl : URL = Bundle.main.url(forResource: fileName, withExtension: "mp3"){
                        
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
    
    
    
    
    
}

