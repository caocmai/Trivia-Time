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
    var question: String = ""
    var correctAnswer: String
    var incorrectAnswers: [String]
    
    init(questionResponse: QuestionResponse) {
        self.id = questionResponse.question
        self.category = questionResponse.category
        self.difficulty = questionResponse.difficulty
        self.correctAnswer = questionResponse.correctAnswer
        self.incorrectAnswers = questionResponse.incorrectAnswers
        self.question = self.replaceSpecialChars(sentence: questionResponse.question)
    }
    
    func checkAnswer(chosenAnswer: String) -> Bool {
        if chosenAnswer.lowercased() == correctAnswer.lowercased() {
            return true
        }
        return false
    }
    
//   https://stackoverflow.com/questions/25607247/how-do-i-decode-html-entities-in-swift
    func replaceSpecialChars(sentence: String) -> String {
        guard let data = sentence.data(using: .utf8) else {
            return sentence
        }

        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]

        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return sentence
        }
        return attributedString.string
    }
    
    

    func allChoices() -> [String] {
        var choices = [String]()
        choices = self.incorrectAnswers
        let randomIdx = Int.random(in: 0...choices.count)
        choices.insert(self.correctAnswer, at: randomIdx)
        
//        for index in choices.indices {
//            choices[index] = replaceSpecialChars(sentence: choices[index])
//        }
        return choices
    }
}
