//
//  StatisticsSummaryView.swift
//  ClimbingTrackerv2
//
//  Created by Raymond-tan Tran on 9/3/24.
//

import SwiftUI

struct StatisticsSummaryView: View {
    var body: some View {
        VStack {
            Text("Statistics Summary")
                .font(.largeTitle)
                .padding()

            // Example statistics
            VStack(alignment: .leading) {
                Text("Year-to-Date")
                    .font(.headline)
                Text("Total Climbs: 20")
                Text("Total Ascent: 500 ft")

                Text("Month-to-Date")
                    .font(.headline)
                Text("Total Climbs: 10")
                Text("Total Ascent: 250 ft")

                Text("Week-to-Date")
                    .font(.headline)
                Text("Total Climbs: 5")
                Text("Total Ascent: 100 ft")
            }
            .padding()

            Spacer()
        }
        .navigationTitle("Statistics")
    }
}

struct StatisticsSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsSummaryView()
    }
}
