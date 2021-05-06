//
//  QuestionView.swift
//  TriviaTime
//
//  Created by Cao Mai on 5/4/21.
//

import SwiftUI


struct QuestionView: View {
    
    @EnvironmentObject var questionController: QuestionController
    @State private var firstTime = true
    
    private var questions: [QuestionViewModel] {
        return questionController.allQuestions
    }
    
    
    var body: some View {
        VStack {
            if questions.isEmpty {
                Text("Loading Questions....")
            } else {

//                Spacer()
                Text(questions.first!.question)
                let choices = questions.first!.allChoices()
                ForEach(choices, id: \.self) { choice in
                    Button {
//                        print(choice, "|",  questions.first!.correctAnswer)
                        let isCorrect = questions.first!.checkAnswer(chosenAnswer: choice)
                        
                        if isCorrect {
                            print("You got it right!")
                        } else {
                            print("You got it wrong, sorry")
                        }
                        
                    } label: {
                        Text(choice)
                    }

                    
                }
//                ForEach(questions, id: \.id) { item in
//                    Text(item.question)
//                }
                
            }
            Text("---------------")
            Button {
                nextRequest()
            } label: {
                Text("Next Question")
            }
        }
        .onAppear { firstRequest()}
        
    }
    
}


private extension QuestionView {
    //MARK: - Methods
    func firstRequest() {
        if firstTime {
            self.questionController.fetchResult()
        }
        firstTime = false
    }
    
    func nextRequest() {
        self.questionController.fetchResult()
    }
}


