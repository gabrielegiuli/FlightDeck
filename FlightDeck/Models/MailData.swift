//
//  MailData.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 07/12/2022.
//

import Foundation
import UIKit

struct MailData {
    var recipientEmail: String
    var body: String
    var subject: String
}

struct MailContext {
    
    let manager = FirebaseManager.shared
    let supportEmail: MailData
    
    init() {
        supportEmail = MailData(recipientEmail: "gabriele.giuli@proton.me",
                                body: "\n\n----- DO NOT EDIT BELOW -----\nuid: \(manager.user?.uid ?? "nil")\ntime: \(Date.now)\nsys: \(UIDevice.current.systemVersion)",
                                subject: "FlightDeck Help")
    }
}
