//
//  AccountViewModel.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 04/12/2022.
//

import Foundation
import MessageUI

final class AccountViewModel: ObservableObject {
    
    private var manager = FirebaseManager.shared
    
    @Published var userFirstName = ""
    @Published var userLastName = ""
    @Published var userBirthDate = Date()
    
    @Published var alertItem: AlertItem?
    @Published var isShowingMailView = false
    @Published var result: Result<MFMailComposeResult, Error>? = nil
    
    init() {
        refreshUserData()
    }
    
    func refreshUserData() {
        userFirstName = manager.userInformation.firstName
        userLastName = manager.userInformation.lastName
    }
    
    func logOut() {
        do {
            try manager.signOut()
        } catch {
            alertItem = AlertContext.unableToLogout
        }
    }
}
