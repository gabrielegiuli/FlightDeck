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
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.indigo, .cyan]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
            VStack {
                Spacer()
                Text("FlightDeck")
                    .font(.system(size: 35))
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                VStack(alignment: .center) {
                    TextField("E-mail", text: $viewModel.emailString)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .padding([.leading, .trailing])
                    SecureField("Password", text: $viewModel.passwordString)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled()
                        .padding()
                    Button {
                        viewModel.logIn()
                    } label: {
                        Text("Log-In")
                            .font(.title3)
                    }
                    .buttonStyle(.bordered)
                    .accentColor(.indigo)
                    .padding()
                    Button {
                        
                    } label: {
                        Text("Sign-Up")
                            .font(.title3)
                    }
                    .buttonStyle(.bordered)
                    .accentColor(.indigo)
                }
                .frame(width: 270, height: 320)
                .background(.white)
                .cornerRadius(10)
                Spacer()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isShowingLoginView: .constant(true))
    }
}
