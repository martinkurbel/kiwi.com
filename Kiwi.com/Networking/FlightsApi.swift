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
                return "flights?v=3&sort=price&locale=en&fly_from=\(flyFrom)&date_from=\(dateFrom)&date_to=\(dateTo)&flight_type=oneway&adults=1&limit=\(limit)&partner=picky&one_for_city=1&vehicle_type=aircraft"
            }
        }
    }
    
    private let api = APIService()
    
    func getFlights(flyFrom: String, dateFrom: String, dateTo: String, limit: Int, completion: @escaping (Result<FlightsModel, Error>) -> Void) {
        
        api.request(with: FlightsPath.getFlights(flyFrom, dateFrom, dateTo, limit)) { (response) in
            switch response {
            case .success(let data):
                do {
                    let flights = try JSONDecoder().decode(FlightsModel.self, from: data)
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
