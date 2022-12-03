//
//  Airport.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 02/12/2022.
//

import Foundation

struct Airport: Codable {
    var ICAO: AirportICAO
    var IATA: String?
    var name: String?
    
    init(ICAOString: String, IATA: String? = nil, name: String? = nil) {
        self.ICAO = AirportICAO(fromString: ICAOString)
        self.IATA = IATA
        self.name = name
    }
    
    init(ICAO: AirportICAO, IATA: String? = nil, name: String? = nil) {
        self.ICAO = ICAO
        self.IATA = IATA
        self.name = name
    }
}
