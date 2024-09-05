//
//  ClimbingSession.swift
//  ClimbingTrackerv2
//
//  Created by Raymond-tan Tran on 9/5/24.
//

import Foundation

struct ClimbingSession: Identifiable {
    let id = UUID()
    let date: Date
    var climbs: [Climb]
    
    var dateFormatted: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }

    var totalAscent: Int {
        climbs.reduce(0) { $0 + $1.ascent }
    }
    
    var climbsCount: Int {
        climbs.count
    }
}
