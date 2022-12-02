//
//  FlightCellView.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 02/12/2022.
//

import SwiftUI

struct FlightCellView: View {
    
    let flight: Flight
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(flight.departureDate.formattedDate)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .bold()
                HStack {
                    Text(flight.departureAirport.ICAO)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(flight.arrivalAirport.ICAO)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Spacer()
                }
            }
            Spacer()
            VStack(alignment: .center, spacing: 5) {
                Image(systemName: "clock")
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                Text(flight.flightDuration.formattedString ?? "")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            VStack(alignment: .center, spacing: 5) {
                Image(systemName: "airplane.arrival")
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                Text(flight.totalLandings.toString)
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

struct FlightCellView_Previews: PreviewProvider {
    static var previews: some View {
        FlightCellView(flight: Flight.mockFlight)
    }
}
