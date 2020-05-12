//
//  Request.swift
//  Kiwi.com
//
//  Created by Martin Kurbel on 12/05/2020.
//  Copyright © 2020 Martin Kurbel. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case head = "HEAD"
}

struct Request {
    
    var path: String
    var method: HTTPMethod
    var headers: [String: String]
    var body: [String: Any]
    
    init(path: String,
         method: HTTPMethod = .get,
         headers: [String: String] = [:],
         body: [String: Any] = [:]) {
        
        self.path = path
        self.method = method
        self.headers = headers
        self.body = body
    }
    
    func build() -> URLRequest {

        guard let url = URL(string: path) else {
            preconditionFailure("Invalid url components")
        }

        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method.rawValue
        if !body.isEmpty, let data = try? JSONSerialization.data(withJSONObject: body) {
            request.httpBody = data
        }
        return request
    }
}
