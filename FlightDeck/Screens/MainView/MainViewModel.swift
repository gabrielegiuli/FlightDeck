//
//  MainViewMoel.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 04/12/2022.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    var manager = FirebaseManager.shared
    @Published var isShowingLoginView: Bool
    
    init() {
        isShowingLoginView = manager.isLoggedIn
    }
    
}
