//
//  QuestionController.swift
//  TriviaTime
//
//  Created by Cao Mai on 5/5/21.
//

import Foundation


final class QuestionController: ObservableObject {
    
    private let apiService: NetworkService
    
    init(apiService: NetworkService = APIService()) {
        self.apiService = apiService
    }
}
