//
//  EventsView.swift
//  Count
//
//  Created by Hengchuan Zhang on 2/26/23.
//

import SwiftUI

struct EventsView: View {
    @Binding var events: [Event]
    @State private var isPresentingNewEventView = false
    @State private var newEventData = Event.Data()
  
    var body: some View {
        List {
            ForEach($events) { $event in
                NavigationLink(destination: DetailView(event: $event)) {
                    CardView(event: event)
                }
            }
        }
        .navigationTitle("Events")
        .toolbar {
            Button(action: {
                isPresentingNewEventView = true
            }) {
                Image(systemName: "plus")
                    .bold()
            }
        }
        .sheet(isPresented: $isPresentingNewEventView) {
            NavigationView {
                DetailEditView(data: $newEventData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingNewEventView = false
                                newEventData = Event.Data()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                let newEvent = Event(data: newEventData)
                                events.append(newEvent)
                                isPresentingNewEventView = false
                                newEventData = Event.Data()
                            }
                        }
                    }
            }
        }
    }
    
    struct ScrumsView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                EventsView(events: .constant(Event.sampleData))
            }
        }
    }
    
}
