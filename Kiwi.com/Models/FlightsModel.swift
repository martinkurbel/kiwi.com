//
//  FlightsModel.swift
//  Kiwi.com
//
//  Created by Martin Kurbel on 12/05/2020.
//  Copyright © 2020 Martin Kurbel. All rights reserved.
//

import Foundation

// MARK: - Flights Model
struct FlightsModel: Codable {
    let searchID: String
    let flights: [Flight]
    let connections: [String]
    let time: Int
    let currency: String
    let currencyRate, fxRate: Int
    let refresh: [JSONAny]
    let del: Double
    let refTasks: [JSONAny]
    let searchParams: SearchParams
    let allStopoverAirports, allAirlines: [String]
    let results: Int

    enum CodingKeys: String, CodingKey {
        case searchID = "search_id"
        case flights = "data"
        case connections, time, currency
        case currencyRate = "currency_rate"
        case fxRate = "fx_rate"
        case refresh, del
        case refTasks = "ref_tasks"
        case searchParams = "search_params"
        case allStopoverAirports = "all_stopover_airports"
        case allAirlines = "all_airlines"
        case results = "_results"
    }
}

// MARK: - Availability
struct Availability: Codable {
    let seats: Int?
}

// MARK: - Baglimit
struct Baglimit: Codable {
    let handWidth, handHeight, handLength, handWeight: Int
    let holdWidth, holdHeight, holdLength, holdDimensionsSum: Int
    let holdWeight: Int

    enum CodingKeys: String, CodingKey {
        case handWidth = "hand_width"
        case handHeight = "hand_height"
        case handLength = "hand_length"
        case handWeight = "hand_weight"
        case holdWidth = "hold_width"
        case holdHeight = "hold_height"
        case holdLength = "hold_length"
        case holdDimensionsSum = "hold_dimensions_sum"
        case holdWeight = "hold_weight"
    }
}

// MARK: - Conversion
struct Conversion: Codable {
    let eur: Int

    enum CodingKeys: String, CodingKey {
        case eur = "EUR"
    }
}

// MARK: - Country
struct Country: Codable {
    let code, name: String
}

// MARK: - Duration
struct Duration: Codable {
    let departure, durationReturn, total: Int

    enum CodingKeys: String, CodingKey {
        case departure
        case durationReturn = "return"
        case total
    }
}

// MARK: - Route
struct Route: Codable {
    let fareBasis, fareCategory, fareClasses: String
    let price: Int
    let fareFamily, foundOn: String
    let lastSeen, refreshTimestamp: Int
    let source: String
    let routeReturn: Int
    let bagsRecheckRequired, guarantee: Bool
    let id, combinationID: String
    let originalReturn, aTime, dTime, aTimeUTC: Int
    let dTimeUTC: Int
    let mapIdfrom, mapIdto, cityTo, cityFrom: String
    let cityCodeFrom, cityCodeTo, flyTo, flyFrom: String
    let airline, operatingCarrier: String
    let equipment: String?
    let latFrom, lngFrom, latTo, lngTo: Double
    let flightNo: Int
    let vehicleType, operatingFlightNo: String

    enum CodingKeys: String, CodingKey {
        case fareBasis = "fare_basis"
        case fareCategory = "fare_category"
        case fareClasses = "fare_classes"
        case price
        case fareFamily = "fare_family"
        case foundOn = "found_on"
        case lastSeen = "last_seen"
        case refreshTimestamp = "refresh_timestamp"
        case source
        case routeReturn = "return"
        case bagsRecheckRequired = "bags_recheck_required"
        case guarantee, id
        case combinationID = "combination_id"
        case originalReturn = "original_return"
        case aTime, dTime, aTimeUTC, dTimeUTC, mapIdfrom, mapIdto, cityTo, cityFrom, cityCodeFrom, cityCodeTo, flyTo, flyFrom, airline
        case operatingCarrier = "operating_carrier"
        case equipment, latFrom, lngFrom, latTo, lngTo
        case flightNo = "flight_no"
        case vehicleType = "vehicle_type"
        case operatingFlightNo = "operating_flight_no"
    }
}

// MARK: - SearchParams
struct SearchParams: Codable {
    let flyFromType, toType: String
    let seats: Seats

    enum CodingKeys: String, CodingKey {
        case flyFromType = "flyFrom_type"
        case toType = "to_type"
        case seats
    }
}

// MARK: - Seats
struct Seats: Codable {
    let passengers, adults, children, infants: Int
}
