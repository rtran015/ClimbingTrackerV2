//
//  Climb.swift
//  ClimbingTrackerv2
//
//  Created by Raymond-tan Tran on 9/5/24.
//

import Foundation

struct Climb: Identifiable {
    var id = UUID()
    var level: String
    var ascent: Int
    var notes: String
}
