//
//  LoginViewModel.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 04/12/2022.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published var usernameString: String = ""
    @Published var passwordString: String = ""
    
}
