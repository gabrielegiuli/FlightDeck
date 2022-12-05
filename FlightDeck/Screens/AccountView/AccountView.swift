//
//  AccountView.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 04/12/2022.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("User Details"){
                    TextField("First Name", text: $viewModel.userFirstName)
                    TextField("Last Name", text: $viewModel.userLastName)
                    DatePicker("Birthday", selection: $viewModel.userBirthDate, displayedComponents: .date)
                }
                Button {
                    viewModel.logOut()
                } label: {
                    Label("Log-Out", systemImage: "person.crop.circle.fill.badge.xmark")
                        .foregroundColor(.red)
                }
            }
            .navigationTitle("🧑‍✈️ Account")
        }
        .onDisappear {
            viewModel.saveChanges()
        }
        .onAppear {
            viewModel.loadUserData()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
