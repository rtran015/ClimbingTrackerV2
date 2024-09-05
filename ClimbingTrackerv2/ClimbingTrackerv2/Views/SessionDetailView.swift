//
//  SessionDetailView.swift
//  ClimbingTrackerv2
//
//  Created by Raymond-tan Tran on 9/3/24.
//

import SwiftUI

struct SessionDetailView: View {
    @State var session: ClimbingSession
    @State private var newLevel: String = ""
    @State private var newAscent: String = ""
    @State private var newNotes: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Date: \(session.dateFormatted)")
                .font(.headline)
                .padding()
            
            Text("Total Climbs: \(session.climbsCount)")
                .font(.subheadline)
                .padding()
            
            // Climb list
            List(session.climbs) { climb in
                NavigationLink(destination: ClimbDetailView(climb: climb)) {
                    HStack {
                        Text("Level: \(climb.level)")
                        Spacer()
                        Text("Ascent: \(climb.ascent) ft")
                    }
                }
            }

            // Add new climb section
            VStack {
                TextField("Level", text: $newLevel)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Ascent", text: $newAscent)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .keyboardType(.numberPad)

                TextField("Notes", text: $newNotes)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: addClimb) {
                    Text("Add Climb")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
        .navigationTitle("Climbing Session Details")
    }

    private func addClimb() {
        if let ascentValue = Int(newAscent) {
            let newClimb = Climb(level: newLevel, ascent: ascentValue, notes: newNotes)
            session.climbs.append(newClimb)
            newLevel = ""
            newAscent = ""
            newNotes = ""
        }
    }
}

struct SessionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleSession = ClimbingSession(date: Date(), climbs: [
            Climb(level: "V3", ascent: 30, notes: "Felt good"),
            Climb(level: "V4", ascent: 40, notes: "A bit tough")
        ])
        SessionDetailView(session: sampleSession)
    }
}
