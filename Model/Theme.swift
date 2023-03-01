//
//  Theme.swift
//  Count
//
//  Created by Hengchuan Zhang on 2/26/23.
//

import Foundation
import SwiftUI

// In Swift, an enum (short for enumeration) is a user-defined data type that has a fixed set of related values.
enum Theme: String {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
// Making contrasting color
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
        case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    var mainColor: Color {
        Color(rawValue)
    }
    
    var name: String {
        rawValue.capitalized
    }
}
