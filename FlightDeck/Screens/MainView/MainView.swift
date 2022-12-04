//
//  MainView.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 04/12/2022.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isUserLoading {
            ProgressView()
                .scaleEffect(2)
        } else if viewModel.isShowingLoginView {
            LoginView(isShowingLoginView: $viewModel.isShowingLoginView)
                .transition(AnyTransition.opacity.animation(.easeInOut(duration: 1.0)))
        } else {
            TabView {
                FlightListView()
                    .tabItem { Label("Flights", systemImage: "paperplane") }
                AccountView()
                    .tabItem { Label("Account", systemImage: "person.crop.circle.fill")}
            }
            .transition(AnyTransition.opacity.animation(.easeInOut(duration: 1.0)))
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
