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
                                               message: Text("We were unable to upload your flight at this time. Check your internet connection and try again later!"),
                                                dismissButton: .default(Text("Ok")))
}
