//
//  CountApp.swift
//  Count
//
//  Created by Hengchuan Zhang on 2/25/23.
//


// importing the SwiftUI framework
import SwiftUI

@main // the ONLY allowed entry point of the whole app
struct CountApp: App {
   @State private var events = Event.sampleData
    //The structure implements the computed property body, which is a requirement of the App protocol.
    var body: some Scene {
        // We use a WindowGroup scene to represent the main window that the app displays.
        WindowGroup {
            NavigationView{
                EventsView(events: $events)
            }
        }
            
        }
    
}
