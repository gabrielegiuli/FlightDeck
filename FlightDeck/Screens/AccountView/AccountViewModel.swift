//
//  AccountViewModel.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 04/12/2022.
//

import Foundation
import MessageUI
import Combine

final class AccountViewModel: ObservableObject {
    
    private var manager = FirebaseManager.shared
    
    @Published var userInformation = UserInformation()
    @Published var userBirthDate = Date()
    
    @Published var alertItem: AlertItem?
    @Published var isShowingMailView = false
    @Published var result: Result<MFMailComposeResult, Error>? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        manager.$userInformation
            .assign(to: \.userInformation, on: self)
            .store(in: &cancellables)
    }
    
    func logOut() {
        do {
            try manager.signOut()
        } catch {
            alertItem = AlertContext.unableToLogout
        }
    }
}
