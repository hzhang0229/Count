//
//  ItemView.swift
//  Count
//
//  Created by Hengchuan Zhang on 2/26/23.
//

import SwiftUI

// The ItemView is a specific view for each item, and will display all available information.
struct ItemView: View {
    var body: some View {
        VStack {
            // spacer is a flexible space that expands along the major axis of its containing stack layout, or on both axes if not contained in a stack.
            // Spacer()
            Text("Item")
                .font(.largeTitle)
            ProgressView(value: 5, total: 15)
            HStack {
                VStack(alignment: .leading) {
                    Text("Days Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Days Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.tophalf.fill")
                }
            }
            Text("0011")
                .foregroundColor(Color.white)
                .frame(width: 300, height: 300, alignment: .center)
                .font(.largeTitle)
                .bold()
                .overlay{
                    Circle()
                        .stroke(Color.orange, lineWidth: 10)
                }
            
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView()
    }
}
