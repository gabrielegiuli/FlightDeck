//
//  MainViewMoel.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 04/12/2022.
//

import Foundation
import Combine

final class MainViewModel: ObservableObject {
    
    @Published var isShowingLoginView: Bool = false
    
    var manager = FirebaseManager.shared
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        manager.$user
            .map({ $0 == nil })
            .assign(to: \.isShowingLoginView, on: self)
            .store(in: &cancellables)
    }
    
}
