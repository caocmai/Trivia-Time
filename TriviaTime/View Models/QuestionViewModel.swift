//
//  QuestionViewModel.swift
//  TriviaTime
//
//  Created by Cao Mai on 5/5/21.
//

import Foundation

struct QuestionViewModel: Identifiable, Codable {
    var id: String
    
    var category: String
    var difficulty: String
    var question: String
    var correctAnswer: String
    var incorrectAnswers: [String]
    
    init(questionResponse: QuestionResponse) {
        self.id = questionResponse.question
        self.category = questionResponse.category
        self.difficulty = questionResponse.difficulty
        self.correctAnswer = questionResponse.correctAnswer
        self.incorrectAnswers = questionResponse.incorrectAnswers
        self.question = questionResponse.question
    }
    
    func checkAnswer(chosenAnswer: String) -> Bool {
        if chosenAnswer == correctAnswer {
            return true
        }
        return false
    }
}
