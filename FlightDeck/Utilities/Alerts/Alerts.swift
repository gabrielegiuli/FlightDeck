//
//  Alerts.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 03/12/2022.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id: UUID = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let unableToUploadFlight = AlertItem(title: Text("Upload Error"),
                                                message: Text("We were unable to upload your flight at this time. Try again later and if this error persists please get in contact with customer support."),
                                                dismissButton: .default(Text("Ok")))
    
    static let invalidICAO = AlertItem(title: Text("Invalid Aiport"),
                                       message: Text("Plase check that the airports' names and try again."),
                                       dismissButton: .default(Text("Ok")))
    
    static let invalidFlightTime = AlertItem(title: Text("Invalid Flight Time"),
                                             message: Text("Plase check the departure and arrival times and try again."),
                                             dismissButton: .default(Text("Ok")))
    
    static func localizedError(title: String, error: Error) -> AlertItem {
        AlertItem(title: Text(title),
                  message: Text(error.localizedDescription),
                  dismissButton: .default(Text("OK")))
    }
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                        message: Text("The email address you have entered is not valid."),
                                        dismissButton: .default(Text("Ok")))
    
    static let emailAlreadyInUse = AlertItem(title: Text("Invalid Email"),
                                             message: Text("The email address you have entered is already associated to an existing account"),
                                             dismissButton: .default(Text("Ok")))
    
    static let wrongPassword = AlertItem(title: Text("Wrong Password"),
                                         message: Text("The password you have entered is not correct. Try with another password."),
                                         dismissButton: .default(Text("Ok")))
    
    static let userDisabled = AlertItem(title: Text("User Disabled"),
                                        message: Text("This user has been disabled by an administrator. Get in contact with customer support."),
                                        dismissButton: .default(Text("Ok")))
    
    static let weakPassword = AlertItem(title: Text("Weak Password"),
                                        message: Text("The chosen password is too weak. The password should be at least six characters long."),
                                        dismissButton: .default(Text("Ok")))
    
    static let unableToLogout = AlertItem(title: Text("Logout Error"),
                                          message: Text("We were unable to log you out. Please try again later and if this problem persists get in contact with customer support."),
                                          dismissButton: .default(Text("Ok")))
    
    static let unableToSaveUserData = AlertItem(title: Text("Server Error"),
                                                message: Text("We were unable to save your user data. Please try again later and if this problem persists get in contact with customer support."),
                                                dismissButton: .default(Text("Ok")))
}
