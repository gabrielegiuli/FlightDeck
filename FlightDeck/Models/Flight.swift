//
//  Flight.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 02/12/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Flight: Codable, Identifiable {
    
    @DocumentID var id: String?
    @ServerTimestamp var createdTime: Timestamp?
    var departureAirport: Airport
    var arrivalAirport: Airport
    private var departureTimestamp: Timestamp
    private var arrivalTimestamp: Timestamp
    var activities: [AirportActivity]?
    
    var departureDate: Date {
        departureTimestamp.dateValue()
    }
    
    var arrivalDate: Date {
        arrivalTimestamp.dateValue()
    }
    
    var totalLandings: Int {
        if let activities = activities {
            return activities.map{ $0.numberOfLandings }.reduce(1, +)
        } else {
            return 1
        }
    }
    
    var flightDuration: TimeInterval {
        arrivalDate.timeIntervalSince(departureDate)
    }
    
    init(id: String? = nil, createdTime: Timestamp? = nil, departureAirport: Airport, arrivalAirport: Airport, departureDate: Date, arrivalDate: Date, activities: [AirportActivity]? = nil) {
        self.id = id
        self.createdTime = createdTime
        self.departureAirport = departureAirport
        self.arrivalAirport = arrivalAirport
        self.departureTimestamp = Timestamp(date: departureDate)
        self.arrivalTimestamp = Timestamp(date: arrivalDate)
        self.activities = activities
    }
}

#if DEBUG
extension Flight {
    static let mockFlight = Flight(departureAirport: Airport(ICAO: "LIEO"),
                                   arrivalAirport: Airport(ICAO: "LIMB"),
                                   departureDate: Date(),
                                   arrivalDate: Date())
}
#endif

