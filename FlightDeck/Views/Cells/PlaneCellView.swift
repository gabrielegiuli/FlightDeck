//
//  PlaneViewCell.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 08/12/2022.
//

import SwiftUI

struct PlaneCellView: View {
    
    let planeHistory: PlaneHistory
    
    var body: some View {
        HStack {
    
            VStack(alignment: .leading) {
                Text(planeHistory.plane.model)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .bold()
                Text(planeHistory.plane.registration)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            Spacer()
            VStack(alignment: .center, spacing: 5) {
                Image(systemName: "clock")
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                Text(planeHistory.totalTime.formattedString ?? "")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            VStack(alignment: .center, spacing: 5) {
                Image(systemName: "airplane.arrival")
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                Text(planeHistory.totalLandings.toString)
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}


struct PlaneCellView_Previews: PreviewProvider {
    static var previews: some View {
        PlaneCellView(planeHistory: MockData.samplePlaneHistory)
    }
}
