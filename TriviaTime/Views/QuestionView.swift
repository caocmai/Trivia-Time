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
            //        Text("Question View Testing")
            if questions.isEmpty {
                Text("Loading Questions....")
            }
            ForEach(questions, id: \.id) { item in
                Text("\(item.correctAnswer)")
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
