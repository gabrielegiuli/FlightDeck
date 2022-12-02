//
//  AirportActivity.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 02/12/2022.
//

import Foundation

enum ActivityType: String, Codable {
    case landing = "Landing"
    case touchAndGo = "Touch and Go"
    case stopAndGo = "Stop and Go"
}

struct AirportActivity: Codable, Identifiable {
    
    var id: UUID = UUID()
    var airport: Airport
    var activityType: ActivityType
    var numberOfLandings: Int
    
    init(airport: Airport, activityType: ActivityType, numberOfLandings: Int = 1) {
        self.airport = airport
        self.activityType = activityType
        self.numberOfLandings = numberOfLandings
    }
    
    init() {
        self.airport = Airport(ICAO: "")
        self.activityType = .touchAndGo
        self.numberOfLandings = 1
    }
}
