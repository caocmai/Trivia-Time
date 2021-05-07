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
    @State private var gotRight = false
    
    
    private var questions: [QuestionViewModel] {
        return questionController.allQuestions
    }
    
    
    var body: some View {
        VStack {
            if questions.isEmpty {
                Text("Loading Questions....")
            } else {
                
                //                Spacer()
                Text(questions[questionIndex].question)
                let choices = questions[questionIndex].allChoices()
                ForEach(choices, id: \.self) { choice in
                    Button {
                        //                        print(choice, "|",  questions.first!.correctAnswer)
                        let isCorrect = questions[questionIndex].checkAnswer(chosenAnswer: choice)
                        
                        if isCorrect {
                            print("You got it right!")
                            self.gotRight = true
                        } else {
                            print("You got it wrong, sorry")
                        }
                        showingScore = true
                        //                        questionIndex += 1
                        //                        if (questionIndex == questions.count - 1) {
                        //                            nextRequest()
                        //                        }
                        
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
            Alert(title: Text(gotRight ? "Right":"Wrong"), message: Text("Your score is score"), dismissButton: .default(Text("Continue")) {
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


