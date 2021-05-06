//
//  QuestionView.swift
//  TriviaTime
//
//  Created by Cao Mai on 5/4/21.
//

import SwiftUI


struct QuestionView: View {
    
    @EnvironmentObject var questionController: QuestionController

    
    var body: some View {
        Text("Question View")
            .onAppear { requestWebData()}
    
    }

}


private extension QuestionView {
  //MARK: - Methods
    func requestWebData() {

//        self.questionController.
        self.questionController.fetchResult()

        
  }
}
