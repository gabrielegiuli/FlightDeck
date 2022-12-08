//
//  EmptyPlaneListView.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 08/12/2022.
//

import Foundation

import SwiftUI

struct EmptyPlaneListView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("There are no registered planes yet!\nClick on \"Add New Plane\"")
                .font(.title3)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .fontWeight(.medium)
                .padding()
            Spacer()
        }
    }
}

struct EmptyPlaneListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyFlightListView()
    }
}
