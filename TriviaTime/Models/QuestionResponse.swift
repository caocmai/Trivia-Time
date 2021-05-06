//
//  QuestionResponse.swift
//  TriviaTime
//
//  Created by Cao Mai on 5/5/21.
//

import Foundation

struct QuestionsResponse: Codable {
    let results: [QuestionResponse]
}

struct QuestionResponse: Codable {
//    let id: ObjectIdentifier
    
    let category: String
    let difficulty: String
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    
    enum CodingKeys: String, CodingKey {
        case category, difficulty, question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
    
}
