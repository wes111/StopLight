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
    
    // The duration of a stoplight cycle in seconds.
    static var cycleDuration: Int {
        return green.duration + yellow.duration + red.duration
    }
    
    static func getColor(from secondCount: Int) -> Self? {
        if secondCount == 0 {
            return .green
        } else if secondCount == green.duration {
            return .yellow
        } else if secondCount == green.duration + yellow.duration {
            return .red
        } else {
            return nil
        }
    }
}
