//
//  MainView.swift
//  Count
//
//  Created by Hengchuan Zhang on 2/26/23.
//

import Foundation
import SwiftUI

struct MainView: View {
    let scrums: [DailyScrum]
    
    var body: some View {
        List {
            ForEach(scrums) { scrum in
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
        }
        .navigationTitle("Daily Scrums")
        .toolbar {
            Button(action: {}) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Scrum")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView(scrums: DailyScrum.sampleData)
        }
    }
}
