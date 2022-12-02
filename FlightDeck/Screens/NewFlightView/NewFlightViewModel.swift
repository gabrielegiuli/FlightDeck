//
//  NewFlightViewModel.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 02/12/2022.
//

import SwiftUI

final class NewFlightViewModel: ObservableObject {
    
    @Published var departureICAO = ""
    @Published var arrivalICAO = ""
    @Published var departureDate = Date()
    @Published var arrivalDate = Date()
    @Published var activities = [AirportActivity]()
    
    private var manager = FirebaseManager.shared
    
    func addNewFlight() {
        let newFlight = Flight(departureAirport: Airport(ICAO: departureICAO),
                               arrivalAirport: Airport(ICAO: arrivalICAO),
                               departureDate: departureDate,
                               arrivalDate: arrivalDate,
                               activities: activities)
        manager.addNewFlight(flight: newFlight)
    }
    
    func addActivity() {
        activities.append(AirportActivity())
    }
    
    func removeLastActivity() {
        let _ = activities.popLast()
    }
    
}
