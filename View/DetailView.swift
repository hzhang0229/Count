//
//  DetailView.swift
//  Count
//
//  Created by Hengchuan Zhang on 2/26/23.
//

import SwiftUI

struct DetailView: View {
    @Binding var event: Event
    @State private var data = Event.Data()
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Event Info")) {
                HStack {
                    Label("Count Down", systemImage: "clock")
                    Spacer()
                    Text("\(Int(Date().distance(to: data.date) / 86400)) days")
                }
                HStack {
                    Label("Due Date", systemImage: "book")
                    Spacer()
                    Text("\(data.date.formatted(date: .long, time: .omitted))")
                }
            }
            Section(header: Text("Note")) {
                Text(event.note)
            }
        }
        
        
        .navigationTitle(event.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                data = event.data
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView(data: $data)
                    .navigationTitle(event.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                event.update(from: data)
                            }
                        }
                    }
            }
        }
    }
    
struct DetailView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                DetailView(event: .constant(Event.sampleData[0]))
            }
        }
    }
}
