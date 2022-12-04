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
            LinearGradient(gradient: Gradient(colors: [.indigo, .gray]),
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
                    TextField("Username", text: $viewModel.usernameString)
                        .textFieldStyle(.roundedBorder)
                        .padding([.leading, .trailing])
                    SecureField("Password", text: $viewModel.passwordString)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    Button {
                        
                    } label: {
                        Text("Log-In")
                            .font(.title3)
                    }
                    .buttonStyle(.bordered)
                    .accentColor(.indigo)
                    .padding()
                    Button {
                        
                    } label: {
                        Text("Register")
                            .font(.title3)
                    }
                    .buttonStyle(.bordered)
                    .accentColor(.indigo)
                }
                .frame(width: 250, height: 350)
                .background(.white)
                .cornerRadius(10)
                Spacer()
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isShowingLoginView: .constant(true))
    }
}
