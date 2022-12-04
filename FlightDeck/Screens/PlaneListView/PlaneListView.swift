//
//  PlaneListView.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 04/12/2022.
//

import SwiftUI

struct PlaneListView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Planes go here")
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
