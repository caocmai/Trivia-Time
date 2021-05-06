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
            .padding()
    }
}


private extension QuestionView {
  //MARK: - Methods
    func requestWebData() {
//    self.petDataController.requestPets(around: postcode.isEmpty ? nil : postcode)
//        self.questionController
  }
}
