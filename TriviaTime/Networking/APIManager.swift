//
//  APIManager.swift
//  TriviaTime
//
//  Created by Cao Mai on 5/5/21.
//

import Foundation

protocol NetworkService {
//  func isTokenValid() -> Bool
//  func refreshAccessToken(completion: @escaping (() -> Void))
  func fetch<T: Decodable>( at endPoint: EndPoint, completion: @escaping (Result<T, Error>) -> Void)
  
}


class APIService: NetworkService {

    
    func fetch<T: Decodable>( at endPoint: EndPoint, completion: @escaping (Result<T, Error>) -> Void) {
//      print(token)
//      if isTokenValid() {
        let token = "test token"
        guard let url = endPoint.url else {
          print("❌ \(#function) - Error: Cannot create URL using - \(endPoint.urlString)")
          return
        }
        let method = "GET"
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpMethod = method
        request.cachePolicy = .reloadRevalidatingCacheData

        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
          if let error = error {
            completion(.failure(error))
          }
          if let data = data {
            do {
              let object = try JSONDecoder().decode(T.self, from: data)
              DispatchQueue.main.async {
                completion(.success(object))
              }
              
            } catch let error {
              completion(.failure(error))
            }
          }
        }
        task.resume()
      }
      
      
//      else {
//        refreshAccessToken { [weak self] in
//          self?.fetch(at: endPoint, completion: completion)
//        }
//      }
//    }
    
    
}
