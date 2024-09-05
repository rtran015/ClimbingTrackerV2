//
//  HomeView.swift
//  ClimbingTrackerv2
//
//  Created by Raymond-tan Tran on 9/5/24.
//

import SwiftUI

struct HomeView: View {
    @State private var sessions: [ClimbingSession] = []
    @State private var showStatistics = false
    @State private var showingNewSessionView = false

    var body: some View {
        NavigationView {
            VStack {
                List(sessions) { session in
                    NavigationLink(destination: SessionDetailView(session: session)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Date: \(session.dateFormatted)")
                                Text("Total Climbs: \(session.climbsCount)")
                                Text("Total Ascent: \(session.totalAscent) ft")
                            }
                            Spacer()
                        }
                    }
                }

                Button(action: {
                    showingNewSessionView = true
                }) {
                    Text("New Climbing Session")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .sheet(isPresented: $showingNewSessionView) {
                    NewClimbingSessionView()
                }
            }
            .navigationTitle("Home")
            .navigationBarItems(trailing: Button(action: {
                showStatistics = true
            }) {
                Text("Statistics")
            })
            .sheet(isPresented: $showStatistics) {
                StatisticsSummaryView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
