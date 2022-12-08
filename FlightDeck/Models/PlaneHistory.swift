//
//  Plane.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 08/12/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Plane: Codable, Identifiable {
    @DocumentID var id: String?
    @ServerTimestamp var createdTime: Timestamp?
    var model: String
    var registration: String
    var userId: String?
}

struct PlaneHistory: Identifiable {
    let id: UUID = UUID()
    var plane: Plane
    var flights: [Flight]
    
    var totalTime: TimeInterval {
        flights.map({ $0.flightDuration }).reduce(0, +)
    }
    
    var totalLandings: Int {
        flights.map({ $0.totalLandings }).reduce(0, +)
    }
}

#if DEBUG
struct MockData {
    static let samplePlane = Plane(model: "S22T", registration: "N972EU")
    static let samplePlaneHistory = PlaneHistory(plane: samplePlane, flights: [])
}
#endif
