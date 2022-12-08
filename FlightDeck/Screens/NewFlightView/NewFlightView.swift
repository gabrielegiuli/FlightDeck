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
                Section {
                    Picker("Plane", selection: $viewModel.selectedPlaneId) {
                        Text("Custom Plane")
                            .tag(nil as String?)
                        ForEach(viewModel.planes) { plane in
                            Text(plane.registration)
                                .tag(plane.id)
                        }
                    }
                }
                Section("Departure") {
                    TextField("ICAO", text: $viewModel.departureICAO.text)
                        .keyboardType(.alphabet)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.characters)
                    DatePicker("Off-Block", selection: $viewModel.departureDate)
                }
                ForEach($viewModel.activities) { $activity in
                    Section {
                        TextField("ICAO", text: $activity.airport.ICAO.text)
                            .keyboardType(.alphabet)
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.characters)
                        Picker("Type", selection: $activity.activityType) {
                            ForEach(ActivityType.allCases) { activity in
                                Text(activity.rawValue)
                                    .tag(activity)
                            }
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
                    TextField("ICAO", text: $viewModel.arrivalICAO.text)
                        .keyboardType(.alphabet)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.characters)
                    DatePicker("Off-Block", selection: $viewModel.arrivalDate)
                }
                Section {
                    Button {
                        isNewFlightViewPresented = viewModel.addNewFlight()
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
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct NewFlightView_Previews: PreviewProvider {
    static var previews: some View {
        NewFlightView(isNewFlightViewPresented: .constant(true))
    }
}
