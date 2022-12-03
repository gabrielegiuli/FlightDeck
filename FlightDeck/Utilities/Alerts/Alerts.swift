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
    
}
