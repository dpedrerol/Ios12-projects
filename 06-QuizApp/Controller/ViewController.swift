//
//  ViewController.swift
//  06-QuizApp
//
//  Created by Carlos Daniel Pedrerol on 10/09/2020.
//  Copyright © 2020 Carlos Daniel Pedrerol. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var labelQuestion: UILabel!
    
    @IBOutlet weak var labelQuestionNumber: UILabel!

    @IBOutlet weak var labelScore: UILabel!
    
    @IBOutlet weak var progressBar: UIView!
    
    @IBOutlet weak var imageQuestion: UIImageView!
    
    var currentScore = 0
    
    var currentQuestionID = 0
    
    var correctQuestionsAnswered = 0
    
    var currentQuestion : Question!
        
    var audioPlayer : AVAudioPlayer!
    
    var topicQuestion = ""
    
    var newBank : [Question] = []
    
    let factory = QuestionsFactory()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         
        
           startGame()
    }
       
 
    func startGame(){
        currentScore = 0
        currentQuestionID = 0
        correctQuestionsAnswered = 0
        
        
//  El método shuffle reordena las preguntas para que cada partida sea diferente
//       self.newBank.shuffle()
        
        
            askNextQuestion()
           
            updateUIElements()
                    
        
    }
    func askNextQuestion() {
        
//        for question in factory.questionsBank.questions where question.topic == topicQuestion{
            

            if let newQuestion = getNewQuestionAt(index: currentQuestionID) {
                self.currentQuestion = newQuestion
                self.labelQuestion.text = self.currentQuestion.question
                self.currentQuestionID += 1
                
                let fileName = newQuestion.imageq
            
                if let imageURL : URL = Bundle.main.url(forResource: fileName, withExtension: "png"){
                    do {
            
                        let imageData = try Data(contentsOf: imageURL)
                        self.imageQuestion.image = UIImage(data: imageData)
                
                    }
                    catch {
                        print(error)
                    }
                }
    
                } else{
            //Aquí la newQuestion es nula -> Ya hemos hecho todas las preguntas -> Game Over
                    gameOver()
//            }
        }
    }
    
    func gameOver() {
        //Método que se llama cuando no hay más preguntas
        let alert = UIAlertController(title: NSLocalizedString("game.over.title", comment: "Título del pop up de game over"), message: "\(NSLocalizedString("game.over.message1", comment: "")) \(self.correctQuestionsAnswered) / \((currentQuestionID))\(NSLocalizedString("game.over.message2", comment: ""))", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            self.startGame()
        }
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func updateUIElements() {
        self.labelScore.text = "\(NSLocalizedString("score.text", comment: ""))\(self.currentScore)"
        self.labelQuestionNumber.text = "\((self.currentQuestionID))/\(self.newBank.count)"
        
        for constraint in self.progressBar.constraints {
            if constraint.identifier == "barWidth" {
                constraint.constant = (self.view.frame.size.width)/CGFloat(self.newBank.count) * CGFloat(self.currentQuestionID)
            }
        }
        for constraint in self.labelQuestion.constraints {
        if constraint.identifier == "qlebelheight" {
            constraint.constant = 191
            }
        }
        for constraint in self.imageQuestion.constraints {
        if constraint.identifier == "iqheight" {
            constraint.constant = 190
            }
        }
    }
   
    @IBAction func buttomPressed(_ sender: UIButton) {
        var isCorrect : Bool
        if (sender.tag == 1){
        //El usuario ha clickado el botón true
            isCorrect = (self.currentQuestion.answer == true)
        } else {
            //El usuario ha clickado el botón false
            isCorrect = (self.currentQuestion.answer == false)
        }
        
        if (isCorrect) {
            self.correctQuestionsAnswered += 1
            self.currentScore += 100 * self.correctQuestionsAnswered
            ProgressHUD.showSuccess("\(NSLocalizedString("question.ok", comment: ""))\n\(self.currentQuestion.explanation)")
            if let soundUrl : URL = Bundle.main.url(forResource: "Win", withExtension: "mp3"){
                        
                do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundUrl)
                }
                catch {
                    print(error)
                }
            audioPlayer.play()
            }
            
        } else {
            ProgressHUD.showError("\(NSLocalizedString("question.ko", comment: ""))\n\(self.currentQuestion.explanation)")
            if let soundUrl : URL = Bundle.main.url(forResource: "Lose", withExtension: "mp3"){
                        
                do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundUrl)
                }
                catch {
                    print(error)
                }
            audioPlayer.play()
            }
                
        }
            askNextQuestion()
            updateUIElements()
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
        func getNewQuestionAt(index : Int) -> Question? {
     
            
            newBank = factory.questionsBank.questions.filter{ $0.topic == topicQuestion }
            
                
            if index < 0 || index >= newBank.count {
                    return nil
                }else {
                   
                    return newBank[index]
                }
            
            }
            
    }





