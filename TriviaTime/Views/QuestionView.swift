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
    @State private var questionIndex = 0
    @State private var showingScore = false
    @State private var isCorrect = false
    
    private var questions: [QuestionViewModel] {
        return questionController.allQuestions
    }
    
    
    var body: some View {
        VStack {
            if questions.isEmpty {
                Text("Loading Questions....")
            } else {
                Text(questions[questionIndex].question)
                let choices = questions[questionIndex].allChoices()
                ForEach(choices, id: \.self) { choice in
                    Button {
                        self.isCorrect = questions[questionIndex].checkAnswer(chosenAnswer: choice)
                        
                        if self.isCorrect {
                            print("You got it right!")
//                            self.isCorrect = true
                        } else {
                            print("You got it wrong, sorry")
                        }
                        showingScore = true
                        
                    } label: {
                        Text(choice)
                    }
                }
            }
            Text("---------------")
            Button {
                nextRequest()
            } label: {
                Text("Next Set of Questions")
            }
        }
        
        .onAppear { firstRequest()}
        .alert(isPresented: $showingScore) {
            Alert(title: Text(self.isCorrect ? "Right":"Wrong"), message: Text(self.isCorrect ? "Nice": "The answer was \(questions[questionIndex].correctAnswer)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
        
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
    
    func askQuestion() {
        if (questionIndex == questions.count - 1) {
            questionIndex = 0
            nextRequest()
        } else {
            questionIndex += 1
        }
    }
}


