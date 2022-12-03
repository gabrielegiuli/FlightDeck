//
//  StringExtensions.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 03/12/2022.
//

import Foundation

extension String {
    var isValidICAO: Bool {
        let ICAOFormat = "[A-Z]{4}"
        let ICAOPredicate = NSPredicate(format: "SELF MATCHES %@", ICAOFormat)
        return ICAOPredicate.evaluate(with: self)
    }
}
