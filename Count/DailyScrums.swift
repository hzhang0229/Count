//
//  DailyScrums.swift
//  Count
//
//  Created by Hengchuan Zhang on 2/26/23.
//

import Foundation
import SwiftUI
//To work with user-generated content, you’ll make DailyScrum conform to the Identifiable protocol for a more robust way to communicate identity. The protocol has one requirement: an id property that provides a stable identifier for the entity.
struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
    }
}

extension DailyScrum {
    static var sampleData: [DailyScrum] {
        [
            DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10),
            DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5),
            DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 5)
        ]
    }
}
