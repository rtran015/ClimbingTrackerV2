//
//  ClimbDetailView.swift
//  ClimbingTrackerv2
//
//  Created by Raymond-tan Tran on 9/5/24.
//

import SwiftUI

struct ClimbDetailView: View {
    var climb: Climb

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Level: \(climb.level)")
                .font(.headline)
                .padding()

            Text("Ascent: \(climb.ascent) ft")
                .font(.subheadline)
                .padding()

            Text("Notes: \(climb.notes)")
                .font(.body)
                .padding()
            
            Spacer()
        }
        .navigationTitle("Climb Details")
    }
}

struct ClimbDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleClimb = Climb(level: "V4", ascent: 25, notes: "Great climb!")
        ClimbDetailView(climb: sampleClimb)
    }
}
