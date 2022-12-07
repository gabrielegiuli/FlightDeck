//
//  AccountView.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 04/12/2022.
//

import SwiftUI
import MessageUI

struct AccountView: View {
    
    @StateObject private var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("User Details") {
                    TextField("First Name", text: $viewModel.userFirstName)
                        .focused($focusedTextField, equals: .firstName)
                        .keyboardType(.alphabet)
                        .submitLabel(.continue)
                        .autocorrectionDisabled()
                    TextField("Last Name", text: $viewModel.userLastName)
                        .focused($focusedTextField, equals: .lastName)
                        .keyboardType(.alphabet)
                        .submitLabel(.done)
                        .autocorrectionDisabled()
                    DatePicker("Birthday", selection: $viewModel.userBirthDate, displayedComponents: .date)
                }
                .onSubmit {
                    switch focusedTextField {
                    case .firstName:
                        focusedTextField = .lastName
                    case .lastName:
                        focusedTextField = nil
                    default:
                        break
                    }
                }
                Section("More about FlightDeck") {
                    Button {
                        viewModel.sheetViewContext = .contactUs
                        viewModel.isShowingSheetView = true
                    } label: {
                        Label("Contact Us", systemImage: "square.and.pencil")
                    }
                    .disabled(!MFMailComposeViewController.canSendMail())
                    Button {
                        viewModel.sheetViewContext = .privacyPolicy
                        viewModel.isShowingSheetView = true
                    } label: {
                        Label("Privacy Policy", systemImage: "doc")
                    }
                    Button {
                        viewModel.sheetViewContext = .credits
                        viewModel.isShowingSheetView = true
                    } label: {
                        Label("Credits", systemImage: "hammer")
                    }
                }
                Button {
                    viewModel.logOut()
                } label: {
                    Label("Log-Out", systemImage: "person.crop.circle.fill.badge.xmark")
                        .foregroundColor(.red)
                }
            }
            .navigationTitle("🧑‍✈️ Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Dismiss") {
                        focusedTextField = nil
                    }
                }
            }
            
        }
        .onAppear { viewModel.refreshUserData() }
        .onDisappear {
            viewModel.saveUserData()
            focusedTextField = .none
        }
        .sheet(isPresented: $viewModel.isShowingSheetView) {
            switch viewModel.sheetViewContext {
            case .contactUs:
                MailView(result: self.$viewModel.result,
                         mailData: MailContext().supportEmail)
            case .credits:
                SafariView(url: URL(string: "https://google.com")!)
            case .privacyPolicy:
                SafariView(url: URL(string: "https://apple.com")!)
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
