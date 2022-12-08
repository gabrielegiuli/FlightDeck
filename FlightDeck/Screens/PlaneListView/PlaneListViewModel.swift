//
//  PlaneListViewModel.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 08/12/2022.
//

import Foundation
import Combine

final class PlaneListViewModel: ObservableObject {
    
    @Published var planesHistory = Array<PlaneHistory>()
    
    private var cancellables = Set<AnyCancellable>()
    private var manager = FirebaseManager.shared
    
    init() {
        manager.$planesHistory
            .assign(to: \.planesHistory, on: self)
            .store(in: &cancellables)
    }
    
    func addNewPlane() {
        
    }
    
}
