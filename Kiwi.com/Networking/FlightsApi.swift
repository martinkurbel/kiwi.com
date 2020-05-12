//
//  FlightsApi.swift
//  Kiwi.com
//
//  Created by Martin Kurbel on 12/05/2020.
//  Copyright © 2020 Martin Kurbel. All rights reserved.
//

import Foundation

class FlightsApi {
    
    enum FlightsPath: APIPathComponent {
        case getFlights(_ flyFrom: String, _ dateFrom: String, _ dateTo: String, _ limit: Int)
        
        var path: String {
            switch self {
            case .getFlights(let flyFrom, let dateFrom, let dateTo, let limit):
                return "flights?v=3&sort=popularity&locale=en&flyFrom=\(flyFrom)&to=anywhere&dateFrom=\(dateFrom)&dateTo=\(dateTo)&typeFlight=oneway&one_per_date=0&adults=1&limit=\(limit)&partner=picky"
            }
        }
    }
    
    private let api = APIService()
    
    func getFlights(flyFrom: String, dateFrom: String, dateTo: String, limit: Int, completion: @escaping (Result<Flights, Error>) -> Void) {
        
        api.request(with: FlightsPath.getFlights(flyFrom, dateFrom, dateTo, limit)) { (response) in
            switch response {
            case .success(let data):
                do {
                    let flights = try JSONDecoder().decode(Flights.self, from: data)
                    completion(.success(flights))
                } catch(let error) {
                    print("---Error", error)
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}