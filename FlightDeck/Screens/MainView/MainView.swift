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
        if viewModel.isShowingLoginView {
            LoginView(isShowingLoginView: $viewModel.isShowingLoginView)
        } else {
            TabView {
                FlightListView()
                    .tabItem { Label("Flights", systemImage: "paperplane") }
                AccountView()
                    .tabItem { Label("Account", systemImage: "person.crop.circle.fill")}
                
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
