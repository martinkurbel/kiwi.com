//
//  Flight.swift
//  Kiwi.com
//
//  Created by Martin Kurbel on 13/05/2020.
//  Copyright © 2020 Martin Kurbel. All rights reserved.
//

import Foundation

// MARK: - Flight
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
    let bagsPrice: [String: Double]
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
    
    var flyDate: String {
        
        let date = Date(timeIntervalSince1970: TimeInterval(dTime))
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
