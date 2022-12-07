//
//  LogInView.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 04/12/2022.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var isShowingLoginView: Bool
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            HStack { Spacer() }
            Spacer()
            VStack(alignment: .center, spacing: 20) {
                Text("FlightDeck")
                    .font(.system(size: 35))
                    .bold()
                VStack {
                    TextField("E-mail", text: $viewModel.emailString)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.passwordString)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled()
                }
                VStack {
                    Button {
                        viewModel.logIn()
                    } label: {
                        HStack {
                            Spacer()
                            Text("Log-in")
                                .font(.title3)
                            Spacer()
                        }
                    }
                    .buttonStyle(.bordered)
                    .accentColor(.indigo)
                    
                    Button {
                        viewModel.register()
                    } label: {
                        HStack {
                            Spacer()
                            Text("Sign-Up")
                                .font(.title3)
                            Spacer()
                        }
                    }
                    .buttonStyle(.bordered)
                    .accentColor(.indigo)
                }
            }
            .frame(width: 270, height: 320)
            .preferredColorScheme(.light)
            .background(Color(.systemBackground))
            .cornerRadius(10)
            Spacer()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
        .frame(maxWidth: 300)
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isShowingLoginView: .constant(true))
    }
}
