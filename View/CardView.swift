//
//  CardView.swift
//  Count
//
//  Created by Hengchuan Zhang on 2/24/23.
//

import SwiftUI


// This struct makes the view of each single event card listed in the main page.
struct CardView: View {
    let event: Event
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(event.title)
                .font(.title2)
            HStack {
                /*if (event.days == 1 || event.days == 0){
                    Label("\(event.date) day", systemImage: "clock")
                        .foregroundColor(.red)
                        .bold()
                        .font(.body)
                } */
                //else
                //{
                Label("\(event.date.formatted(date: .long, time: .omitted))", systemImage: "clock")
                        .font(.body)
                //}
            }
            .font(.caption)
        }
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var event = Event.sampleData[0]
    static var previews: some View {
        CardView(event: event)
            .previewLayout(.fixed(width: 350, height: 70))
    }
}

