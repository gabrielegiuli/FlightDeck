//
//  ContentView.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 02/12/2022.
//

import SwiftUI

struct FlightListView: View {
    
    //    @StateObject var manager = FirebaseManager.shared
    @StateObject var viewModel = FlightListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.flights.isEmpty {
                    EmptyFlightListView()
                } else {
                    List {
                        ForEach(viewModel.flights) { flight in
                            FlightCellView(flight: flight)
                        }
                    }
                }
                Button {
                    viewModel.addNewFlight()
                } label: {
                    Label("Add New Flight", systemImage: "plus.circle.fill")
                }
            }
            .navigationTitle("📋 Logbook")
        }
        .sheet(isPresented: $viewModel.isNewFlightViewPresented) {
            NewFlightView(isNewFlightViewPresented: $viewModel.isNewFlightViewPresented)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FlightListView()
    }
}
