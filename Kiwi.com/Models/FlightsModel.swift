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

// MARK: - Datum
struct Flight: Codable {
    let id: String
    let dTime, dTimeUTC, aTime, aTimeUTC: Int
    let nightsInDest: Int?
    let duration: Duration
    let flyDuration, flyFrom, cityFrom, cityCodeFrom: String
    let countryFrom: Country
    let mapIdfrom, flyTo, cityTo, cityCodeTo: String
    let countryTo: Country
    let mapIdto: String
    let distance: Double
    let routes: [[String]]
    let airlines: [String]
    let pnrCount: Int
    let hasAirportChange: Bool
    let technicalStops, price: Int
    let bagsPrice: [String: Int]
    let baglimit: Baglimit
    let availability: Availability
    let facilitatedBookingAvailable: Bool
    let conversion: Conversion
    let quality: Double
    let bookingToken: String
    let deepLink: String
    let trackingPixel: String?
    let p1, p2, p3: Int
    let transfers: [JSONAny]
    let typeFlights: [String]
    let popularity: Int
    let virtualInterlining: Bool
    let foundOn: [String]
    let route: [Route]

    enum CodingKeys: String, CodingKey {
        case id, dTime, dTimeUTC, aTime, aTimeUTC, nightsInDest, duration
        case flyDuration = "fly_duration"
        case flyFrom, cityFrom, cityCodeFrom, countryFrom, mapIdfrom, flyTo, cityTo, cityCodeTo, countryTo, mapIdto, distance, routes, airlines
        case pnrCount = "pnr_count"
        case hasAirportChange = "has_airport_change"
        case technicalStops = "technical_stops"
        case price
        case bagsPrice = "bags_price"
        case baglimit, availability
        case facilitatedBookingAvailable = "facilitated_booking_available"
        case conversion, quality
        case bookingToken = "booking_token"
        case deepLink = "deep_link"
        case trackingPixel = "tracking_pixel"
        case p1, p2, p3, transfers
        case typeFlights = "type_flights"
        case popularity
        case virtualInterlining = "virtual_interlining"
        case foundOn = "found_on"
        case route
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
