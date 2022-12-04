//
//  AccountViewModel.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 04/12/2022.
//

import Foundation

final class AccountViewModel: ObservableObject {
    
    private var manager = FirebaseManager.shared
    
    func logOut() {
        try? manager.signOut()
    }
}
