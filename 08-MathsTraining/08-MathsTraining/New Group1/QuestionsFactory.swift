//
//  QuestionsFactory.swift
//  08-MathsTraining
//
//  Created by Carlos Daniel Pedrerol on 30/10/2020.
//

import Foundation


class QuestionsFactory {
    
    private var questions = [Question]()
    public private(set) var score = 0
    public private(set) var pointsPerQuestion = 100
//    public private(set) var maxQuestions: Int = 6
    
    

    init() {
            addNewQuestion()
    }
    
    func restartData(){
        self.score = 0
        self.questions.removeAll()
        addNewQuestion()
    }
    
    func addNewQuestion() {
        questions.insert(createQuestion(), at: 0)
        
    }
    
    func getQuestionAt(position: Int) -> Question? {
        if position<0||position>=questions.count {
            return nil
        }
        return self.questions[position]
    }
    
    func updateQuestion(at index: Int, with answer: Int) {
        questions[index].useranswer = answer
    }
    
    func validateQuestion(at index: Int) {
        
        if self.questions[index].useranswer == self.questions[index].answer {
            self.score += pointsPerQuestion
        }
    }
  
    func numberOfQuestions() -> Int {
        return questions.count
    }
    
    func createQuestion() -> Question {
        var question = ""
        var correctAnswer = 0
        
        while true {
            let firstNumber = Int.random(in: 0...9)
            let secondNumber = Int.random(in: 0...9)
            
            if Bool.random() {
                let result = firstNumber + secondNumber
                if result < 10 {
                    question = "\(firstNumber) + \(secondNumber)"
                    correctAnswer = result
                    break
                }
            }else {
                let result = firstNumber - secondNumber
                if result >= 0 {
                    question = "\(firstNumber) - \(secondNumber)"
                    correctAnswer = firstNumber - secondNumber
                    break
                }
            }
          }
        return Question(text: question, answer: correctAnswer, useranswer: nil)
    }
    
}
