//
//  AccountViewModel.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 04/12/2022.
//

import Foundation
import MessageUI
import Combine

final class AccountViewModel: ObservableObject {
    
    private var manager = FirebaseManager.shared
    
    @Published var userFirstName: String = ""
    @Published var userLastName: String = ""
    @Published var userBirthDate = Date()
    
    @Published var alertItem: AlertItem?
    @Published var isShowingMailView = false
    @Published var result: Result<MFMailComposeResult, Error>? = nil
    
    var mailData: MailData {
        MailData(recipientEmail: "gabriele.giuli@proton.me",
                 body: "\n\n----- DO NOT EDIT BELOW -----\nuid: \(manager.user?.uid ?? "nil")\ntime: \(Date.now)\nsys: \(UIDevice.current.systemVersion)",
                 subject: "FlightDeck Help")
    }
    
    func loadUserData() {
        manager.readUserInformation { userInformation in
            self.userFirstName = userInformation?.firstName ?? ""
            self.userLastName = userInformation?.lastName ?? ""
        }
    }
    
    func logOut() {
        do {
            try manager.signOut()
        } catch {
            alertItem = AlertContext.unableToLogout
        }
    }
    
    func saveChanges() {
        try? manager.saveUserInformation(userInformation: UserInformation(firstName: userFirstName, lastName: userLastName))
    }
}
