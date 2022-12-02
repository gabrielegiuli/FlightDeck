//
//  FlightListViewModel.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 02/12/2022.
//

import Foundation
import Combine

final class FlightListViewModel: ObservableObject {
    
    @Published var flights = Array<Flight>()
    @Published var isNewFlightViewPresented = false
    
    var manager = FirebaseManager.shared
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        manager.$flights
            .assign(to: \.flights, on: self)
            .store(in: &cancellables)
    }
    
    func addNewFlight() {
        isNewFlightViewPresented = true
    }
}
