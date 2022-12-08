//
//  NewFlightViewModel.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 02/12/2022.
//

import SwiftUI
import Combine

final class NewFlightViewModel: ObservableObject {
    
    @Published var departureICAO = AirportICAO()
    @Published var arrivalICAO = AirportICAO()
    @Published var activities = [AirportActivity]()
    @Published var alertItem: AlertItem?
    @Published var planes = [Plane]()
    @Published var selectedPlaneId: String?
    
    private var manager = FirebaseManager.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var departureDate = Date() {
        didSet {
            if arrivalDate < departureDate {
                arrivalDate = departureDate
            }
        }
    }
    
    @Published var arrivalDate = Date() {
        didSet {
            if arrivalDate < departureDate {
                departureDate = arrivalDate
            }
        }
    }
    
    var selectedPlane: Plane? {
        planes.filter({ $0.id == selectedPlaneId }).first
    }
    
    init() {
        manager.$planes
            .assign(to: \.planes, on: self)
            .store(in: &cancellables)
    }
    
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
        
        guard arrivalDate.timeIntervalSince(departureDate) > 0 else {
            alertItem = AlertContext.invalidFlightTime
            return false
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
                               activities: activities,
                               planeId: selectedPlaneId)
        
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
