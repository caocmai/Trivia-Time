//
//  QuestionController.swift
//  TriviaTime
//
//  Created by Cao Mai on 5/5/21.
//

import Foundation


final class QuestionController: ObservableObject {
    
    @Published private(set) var allQuestions: [QuestionViewModel] = []
    
    private let apiService: NetworkService
    
    init(apiService: NetworkService = APIService()) {
        self.apiService = apiService
    }
    
    func fetchResult() {
        let filters = ["amount": "10", "type": "multiple"]
        let filtered = filters.compactMapValues { $0 }
        let queryItems = filtered.map { URLQueryItem(name: $0.key, value: $0.value) }
//        print(queryItems)
    
        let endPoint2 = EndPoint.questions(queryItems: queryItems)
        
//        apiService.fetchTEST(at: endPoint2)
        apiService.fetch(at: endPoint2) { [weak self ] (result: Result<QuestionsResponse, Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let questionData):
                self?.allQuestions = questionData.results.map { QuestionViewModel(questionResponse: $0)}
//                print(self?.allQuestions)
            }
            
        }
    }
}
