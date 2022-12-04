//
//  LoginViewModel.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 04/12/2022.
//

// https://medium.com/firebase-developers/ios-firebase-authentication-sdk-email-and-password-login-6a3bb27e0536
// https://peterfriese.dev/posts/replicating-reminder-swiftui-firebase-part2/

import Foundation
import FirebaseAuth
import Firebase

final class LoginViewModel: ObservableObject {
    
    @Published var emailString: String = ""
    @Published var passwordString: String = ""
    @Published var alertItem: AlertItem?
    
    private var manager = FirebaseManager.shared
    
    func logIn() {
        manager.signIn(withEmail: emailString, password: passwordString) { [self] error in
            if let error = error as? NSError {
                switch error.code {
                case AuthErrorCode.invalidEmail.rawValue:
                    alertItem = AlertContext.invalidEmail
                case AuthErrorCode.wrongPassword.rawValue:
                    alertItem = AlertContext.wrongPassword
                case AuthErrorCode.userDisabled.rawValue:
                    alertItem = AlertContext.userDisabled
                default:
                    alertItem = AlertContext.localizedError(title: "Log-In Error",
                                                            error: error)
                }
            }
        }
    }
    
    func register() {
        manager.register(withEmail: emailString, password: passwordString) { [self] error in
            if let error = error as? NSError {
                switch error.code {
                case AuthErrorCode.emailAlreadyInUse.rawValue:
                    alertItem = AlertContext.emailAlreadyInUse
                case AuthErrorCode.invalidEmail.rawValue:
                    alertItem = AlertContext.invalidEmail
                default:
                    alertItem = AlertContext.localizedError(title: "Sign-Up error",
                                                            error: error)
                }
            }
        }
    }
    
}
