//
//  Event.swift
//  Count
//
//  Created by Hengchuan Zhang on 2/26/23.
//

import Foundation

// This is the most important model for this project. We defined the Event object here with basic properties that are required for the project.
// Each Event has a unique ID.

// Identifiable is a class of types whose instances hold the value of an entity with stable identity.
// As for 2/26/23, I am using UUIDs, which is a guarenteed way to make unique identities. However, for the nature of the project (only 1 semester), we are not using a DB.
// We will leave it as this so that it could be refined somedays.
// Codable is a type alias for the Encodable and Decodable protocols. When you use Codable as a type or a generic constraint, it matches any type that conforms to both protocols.

// When you declare a property as a @State, you create a source of truth within your view. The system identifies all elements of a view that depend on the value of a @State property.User interactions might change your @State property. The system renders a new version of the UI by updating any views that depend on that property.


//
struct Event: Identifiable, Codable {
    let id: UUID
    var title: String
    var note: String
    var date: Date
    
    init(id: UUID = UUID(), title: String, note: String, date: Date = Date()) {
        self.id = id
        self.title = title
        self.note = note
        self.date = date
    }
}

extension Event {
    struct Note: Identifiable, Codable {
        let id: UUID
        var content: String
        
        init(id: UUID = UUID(), content: String) {
            self.id = id
            self.content = content
        }
    }
// Making the struct data helps with the modification of the editview.
    struct Data {
        var title: String = ""
        var note: String = ""
        var date: Date = Date()
    }
    
    var data: Data {
        Data(title: title, note: note,date:date)
    }
    

    // This function help us to update the existing data.
    mutating func update(from data: Data) {
        title = data.title
        note = data.note
        date = data.date
        
    }
    
    init(data: Data) {
        id = UUID()
        title = data.title
        note = data.note
        date = data.date
    }
}

extension Event {
    static let sampleData: [Event] =
    [
        Event(title: "CS6221 Midterm", note: "Online", date: Date(timeIntervalSinceNow: 187667)),
        Event(title: "CS6221 Final", note: "when the thousand years are ended, Satan will be released from his prison", date: Date(timeIntervalSinceNow: 497667)),
        Event(title: "Google Accept Offer Deadline", note: "Must accept the offer before this date", date:Date(timeIntervalSinceNow: 872667))
    ]
}
