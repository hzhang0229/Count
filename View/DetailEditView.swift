//
//  DetailEditView.swift
//  Count
//
//  Created by Hengchuan Zhang on 2/26/23.
//


import SwiftUI

struct DetailEditView: View {
    @Binding var data: Event.Data
    var currentDate = Date()
    
    var body: some View {
        Form {
            Section(header: Text("Event Name")) {
                TextField("Title", text: $data.title)
            }
           Section(header: Text("Event Date")){
               DatePicker(
                       "Set Date",
                       selection: $data.date,
                       displayedComponents: [.date]
                   )
               Text("\(data.title) is on \(data.date.formatted(date: .numeric, time: .omitted))")
                   .foregroundColor(.red)
                   .bold()
               Text("\(Int(currentDate.distance(to: data.date) / 86400)) days left")
            }
            /* Section(header: Text("Count")){
                TextField("Count", value: $, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding()
            } */
            Section(header: Text("Note")){
                TextField("Note", text: $data.note)
            }
        }
    }
    struct DetailEditView_Previews: PreviewProvider {
        static var previews: some View {
            DetailEditView(data: .constant(Event.sampleData[0].data))
        }
    }
}
