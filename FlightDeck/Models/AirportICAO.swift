//
//  StringSubclasses.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 03/12/2022.
//

import SwiftUI

class AirportICAO: Codable {
    
    var text: String {
        didSet {
            let ICAOFormat = "[A-Za-z]{0,4}"
            let ICAOPredicate = NSPredicate(format: "SELF MATCHES %@", ICAOFormat)
            if !ICAOPredicate.evaluate(with: text) {
                text = oldValue
            }
            text = text.uppercased()
        }
    }
    
    var isValid: Bool {
        text.isValidICAO
    }
    
    init(fromString string: String) {
        text = string.isValidICAO ? string : ""
    }
    
    init() {
        text = ""
    }
    
}
