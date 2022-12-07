//
//  AccountViewModel.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 04/12/2022.
//

import Foundation
import MessageUI

final class AccountViewModel: ObservableObject {
    
    enum SheetViewContext {
        case contactUs, privacyPolicy, credits
    }
    
    private var manager = FirebaseManager.shared
    
    @Published var userFirstName = ""
    @Published var userLastName = ""
    @Published var userBirthDate = Date()
    
    @Published var sheetViewContext = SheetViewContext.contactUs
    @Published var isShowingSheetView = false
    @Published var result: Result<MFMailComposeResult, Error>? = nil
    
    init() {
        refreshUserData()
    }
    
    func refreshUserData() {
        userFirstName = manager.userInformation.firstName
        userLastName = manager.userInformation.lastName
        userBirthDate = manager.userInformation.birthDate
    }
    
    func saveUserData() {
        do {
            let newUserInformation = UserInformation(fromAccount: self)
            try manager.saveUserInformation(userInformation: newUserInformation)
        } catch {
            print("Unable to update user data")
        }
    }
    
    func logOut() {
        do {
            try manager.signOut()
        } catch {
            //alertItem = AlertContext.unableToLogout
        }
    }
}
