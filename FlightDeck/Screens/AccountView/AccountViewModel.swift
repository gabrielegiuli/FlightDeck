//
//  AccountViewModel.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 04/12/2022.
//

import Foundation
import Combine

final class AccountViewModel: ObservableObject {
    
    private var manager = FirebaseManager.shared
    
    @Published var userFirstName: String = ""
    @Published var userLastName: String = ""
    @Published var userBirthDate = Date()
    
    func loadUserData() {
        userFirstName = manager.userInformation?.firstName ?? ""
        userLastName = manager.userInformation?.lastName ?? ""
    }
    
    func logOut() {
        try? manager.signOut()
    }
    
    func saveChanges() {
        try? manager.saveUserInformation(userInformation: UserInformation(firstName: userFirstName, lastName: userLastName))
    }
}
