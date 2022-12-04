//
//  LoginViewModel.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 04/12/2022.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published var emailString: String = ""
    @Published var passwordString: String = ""
    
    private var manager = FirebaseManager.shared
    
    func logIn() {
        manager.signIn(withEmail: emailString, password: passwordString) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
}
