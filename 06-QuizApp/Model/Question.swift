//
//  Question.swift
//  06-QuizApp
//
//  Created by Carlos Daniel Pedrerol on 11/09/2020.
//  Copyright © 2020 Carlos Daniel Pedrerol. All rights reserved.
//

import Foundation

class Question : CustomStringConvertible, Codable {
    
    let question : String
    let answer : Bool
    let explanation : String
    let imageq : String
    
    
    
    /*enum CodingKeys : String, CodingKey {
        case questionText = "question"
        case answer = "answer"
        case answerExplanation = "explanation"
    }*/
    
    var description : String {
        let respuesta = (answer ? "Verdadera" : "Falsa")
        return """
        Pregunta:
        =========
            - \(question)
            - Respuesta: \(respuesta)
            - Explicación: \(explanation)
        """
    }
    
    init(text: String, correctAnswer: Bool, answer : String, image : String) {
        self.question = text
        self.answer = correctAnswer
        self.explanation = answer
        self.imageq = image
      
    }
}
struct QuestionsBank : Codable {
    var questions : [Question]
    }

