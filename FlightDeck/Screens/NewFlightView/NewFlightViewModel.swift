//
//  NewFlightViewModel.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 02/12/2022.
//

import SwiftUI

final class NewFlightViewModel: ObservableObject {
    
    @Published var departureICAO = AirportICAO()
    @Published var arrivalICAO = AirportICAO()
    @Published var departureDate = Date()
    @Published var arrivalDate = Date()
    @Published var activities = [AirportActivity]()
    @Published var alertItem: AlertItem?
    private var manager = FirebaseManager.shared
    
    func checkFormIsValid() -> Bool {
        guard departureICAO.isValid && arrivalICAO.isValid else {
            alertItem = AlertContext.invalidICAO
            return false
        }
        
        for activity in activities {
            guard activity.airport.ICAO.isValid else {
                alertItem = AlertContext.invalidICAO
                return false
            }
        }
        return true
    }
    
    func addNewFlight() -> Bool {
        guard checkFormIsValid() else {
            return true
        }
        
        let newFlight = Flight(departureAirport: Airport(ICAO: departureICAO),
                               arrivalAirport: Airport(ICAO: arrivalICAO),
                               departureDate: departureDate,
                               arrivalDate: arrivalDate,
                               activities: activities)
        
        do {
            try manager.addNewFlight(flight: newFlight)
            return false
        } catch {
            alertItem = AlertContext.unableToUploadFlight
            return true
        }
    }
    
    func addActivity() {
        activities.append(AirportActivity())
    }
    
    func removeLastActivity() {
        let _ = activities.popLast()
    }
    
}
