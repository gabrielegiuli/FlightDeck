//
//  Airport.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 02/12/2022.
//

import Foundation

struct Airport: Codable {
    var ICAO: String
    var IATA: String?
    var name: String?
}
