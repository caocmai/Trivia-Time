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
    
    func fetchResult() {
        let filters = ["amount": "10", "type": "multiple"]
        let filtered = filters.compactMapValues { $0 }
        let queryItems = filtered.map { URLQueryItem(name: $0.key, value: $0.value) }
        print(queryItems)
        let endPoint2 = EndPoint.questions(queryItems: queryItems)
        
        apiService.fetchTEST(at: endPoint2)
    }
}
