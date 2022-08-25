//
//  StopLightState.swift
//  StopLight
//
//  Created by Wesley Luntsford on 8/25/22.
//

import SwiftUI

enum StopLightColor {
    case green
    case yellow
    case red
    
    // The duration in seconds.
    var duration: Int {
        switch self {
        case .green: return 5
        case .yellow: return 2
        case .red: return 4
        }
    }
}
