//
//  File.swift
//  06-QuizApp
//
//  Created by Carlos Daniel Pedrerol on 11/09/2020.
//  Copyright © 2020 Carlos Daniel Pedrerol. All rights reserved.
//

import Foundation

class QuestionsFactory {
    
    var questionsBank : QuestionsBank!
    
    
    init(){
        //Procesado manual de plist
        /*if let path = Bundle.main.path(forResource: "QuestionBank", ofType: "plist"){
            if let plist = NSDictionary(contentsOfFile: path){
                let questionData = plist["Questions"] as! [AnyObject]
                
                for question in questionData {
                    if let text = question["question"], let ans = question["answer"], let expl = question["explanation"] {
                        questions.append(question(text: text as! String, correctAnswer: ans as! Bool, answer: expl as! String, tema: tema as! String))
                    }
                }
            }
        }*/
       
        //Procesado automático de plist con codable
        do {
            if let url = Bundle.main.url(forResource: "QuestionBank", withExtension: "plist") {
                let data = try Data(contentsOf: url)
                self.questionsBank = try PropertyListDecoder().decode(QuestionsBank.self, from: data)
               
        }
        }catch{
                print(error)
            }
        }
  
   
     func getQuestionAt(index : Int) -> Question? {
        
     if index<0 || index>=self.questionsBank.questions.count {
         return nil
     }else {
         return self.questionsBank.questions[index] 
        
    }
}

    
    func getRandomQuestion() -> Question {
        let index = Int(arc4random_uniform(UInt32(self.questionsBank.questions.count)))
        return self.questionsBank.questions[index]
    
    }
    
    
        
}
    

