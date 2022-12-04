//
//  AccountViewModel.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 04/12/2022.
//

import Foundation

final class AccountViewModel: ObservableObject {
    
    private var manager = FirebaseManager.shared
    
    @Published var userFirstName: String = ""
    @Published var userLastName: String = ""
    @Published var userBirthDate = Date()
    
    func logOut() {
        try? manager.signOut()
    }
    
    func saveChanges() {
        
    }
}
