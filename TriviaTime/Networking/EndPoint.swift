//
//  EndPoint.swift
//  TriviaTime
//
//  Created by Cao Mai on 5/5/21.
//

import Foundation

struct EndPoint {
  var path: String
  var queryItems = [URLQueryItem]()
  
  var urlString: String {
    url?.absoluteString ?? "errorURL"
//    return  "https://" + Keys.baseURLPath + path
  }

  var url: URL? {
    var components = URLComponents()
    components.scheme = "https"
    components.host = Keys.baseURLPath
    components.path = path
    components.queryItems = queryItems
    return components.url
  }
}
