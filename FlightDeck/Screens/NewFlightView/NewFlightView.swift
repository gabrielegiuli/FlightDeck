//
//  NewFlightView.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 02/12/2022.
//

import SwiftUI

struct NewFlightView: View {

    @Binding var isNewFlightViewPresented: Bool
    @StateObject var viewModel = NewFlightViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Departure") {
                    TextField("ICAO", text: $viewModel.departureICAO)
                    DatePicker("Off-Block", selection: $viewModel.departureDate)
                }
                ForEach($viewModel.activities) { $activity in
                    Section {
                        TextField("ICAO", text: $activity.airport.ICAO)
                        Picker("Type", selection: $activity.activityType) {
                            Text("Landing")
                            Text("Touch and Go")
                            Text("Stop and Go")
                        }
                        Stepper("\(activity.numberOfLandings) Landing\(activity.numberOfLandings == 1 ? "" : "s")", value: $activity.numberOfLandings, in: 1...10)
                    }
                }
                Section {
                    Button {
                        viewModel.addActivity()
                    } label: {
                        Label("Add Activity", systemImage: "plus.circle.fill")
                    }
                    if !viewModel.activities.isEmpty {
                        Button {
                            viewModel.removeLastActivity()
                        } label: {
                            Label("Remove Activity", systemImage: "trash")
                        }
                        .foregroundColor(.red)
                    }
                }
                Section("Arrival") {
                    TextField("ICAO", text: $viewModel.arrivalICAO)
                    DatePicker("Off-Block", selection: $viewModel.arrivalDate)
                }
                Section {
                    Button {
                        viewModel.addNewFlight()
                        isNewFlightViewPresented = false
                    } label: {
                        Label("Save Changes", systemImage: "square.and.arrow.down")
                    }
                    Button {
                        isNewFlightViewPresented = false
                    } label: {
                        Label("Discard Changes", systemImage: "trash")
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("New Flight")
        }
    }
}

struct NewFlightView_Previews: PreviewProvider {
    static var previews: some View {
        NewFlightView(isNewFlightViewPresented: .constant(true))
    }
}
