//
//  AccountView.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 04/12/2022.
//

import SwiftUI
import MessageUI

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
                Section {
                    Button {
                        viewModel.isShowingMailView = true
                    } label: {
                        Label("Contact Us", systemImage: "square.and.pencil")
                    }
                    .disabled(!MFMailComposeViewController.canSendMail())
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
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
        .sheet(isPresented: $viewModel.isShowingMailView) {
            MailView(result: self.$viewModel.result,
                     mailData: viewModel.mailData)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
