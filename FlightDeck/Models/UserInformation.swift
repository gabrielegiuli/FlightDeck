//
//  UserInformation.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 04/12/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserInformation: Codable {
    
    @ServerTimestamp var createdTime: Timestamp?
    var firstName: String
    var lastName: String
    var birthDate: Date
    
    init() {
        firstName = ""
        lastName = ""
        birthDate = Date()
    }
    
    init(fromAccount model: AccountViewModel) {
        firstName = model.userFirstName
        lastName = model.userLastName
        birthDate = model.userBirthDate
    }
}
