//
//  APIService.swift
//  Kiwi.com
//
//  Created by Martin Kurbel on 12/05/2020.
//  Copyright © 2020 Martin Kurbel. All rights reserved.
//

import Foundation

class APIService {
    
    private let session = URLSession(configuration: .default)
    
    private let serverUrl = "https://api.skypicker.com/"
    
    func request(with path: APIPathComponent, method: HTTPMethod = .get,completion: @escaping (Result<Data, Error>) -> Void) {

        let fullUrl = serverUrl + path.path
        let request = Request(path: fullUrl, method: method).build()
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
                print(error)
            }
            
            if let response = response as? HTTPURLResponse {
                
                switch response.statusCode {
                case 200..<204:
                    break
                default:
                    completion(.failure(HTTPResponseError.internalError))
                    print(error ?? "")
                }
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            }
        }
        
        task.resume()
    }
}

protocol APIPathComponent {
    var path: String { get }
}

enum HTTPResponseError: Error {
    case internalError
}
