//
//  StopLightUpdate.swift
//  StopLight
//
//  Created by Wesley Luntsford on 8/26/22.
//

import Foundation

// There are 2 ways for a stoplight to update. Either
// the light changes on schedule or from a reset.
enum StopLightUpdate: CustomStringConvertible {
    
    case reset
    case changed(StopLightColor)
    
    var description: String {
        switch self {
        case .reset:
            return "Restart Pressed"
            
        case .changed(let color):
            return "Light Changed - \(color.rawValue)"
        }
    }
}
