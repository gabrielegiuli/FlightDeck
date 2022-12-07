//
//  EmptyFlightListView.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 07/12/2022.
//

import SwiftUI

struct EmptyFlightListView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("There are no recorded flights yet!\nClick on \"Add New Flight\"")
                .font(.title3)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .fontWeight(.medium)
                .padding()
            Spacer()
        }
    }
}

struct EmptyFlightListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyFlightListView()
    }
}
