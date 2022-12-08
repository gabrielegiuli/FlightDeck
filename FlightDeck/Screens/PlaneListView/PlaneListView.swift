//
//  PlaneListView.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 04/12/2022.
//

import SwiftUI

struct PlaneListView: View {
    
    @StateObject var viewModel = PlaneListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.planesHistory.isEmpty {
                    EmptyPlaneListView()
                } else {
                    List {
                        ForEach(viewModel.planesHistory) { planeHistory in
                            PlaneCellView(planeHistory: planeHistory)
                        }
                    }
                }
                Button {
                    viewModel.addNewPlane()
                } label: {
                    Label("Add New Plane", systemImage: "plus.circle.fill")
                }
            }
            .navigationTitle("✈️ Planes")
        }
    }
}

struct PlaneListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaneListView()
    }
}
