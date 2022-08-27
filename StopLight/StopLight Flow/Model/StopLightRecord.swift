//
//  StopLightRecord.swift
//  StopLight
//
//  Created by Wesley Luntsford on 8/26/22.
//

import Foundation

struct StopLightRecord: Identifiable {
    let id: UUID
    let date: Date
    let update: StopLightUpdate
    
    init(_ update: StopLightUpdate) {
        self.id = UUID()
        self.date = Date()
        self.update = update
    }
    
    init(using codable: CodableStopLight) {
        self.id = codable.id
        self.date = codable.date
        self.update = StopLightRecord.getStopLightUpdate(from: codable)
    }
    
    // Helper function to get the StopLightUpdate from a CodableStopLight.
    private static func getStopLightUpdate(from record: CodableStopLight) -> StopLightUpdate {
        switch record.title {
        case StopLightUpdate.reset.description: return StopLightUpdate.reset
        case StopLightUpdate.changed(.green).description: return StopLightUpdate.changed(.green)
        case StopLightUpdate.changed(.yellow).description: return StopLightUpdate.changed(.yellow)
        case StopLightUpdate.changed(.red).description: return StopLightUpdate.changed(.red)
        // The default here will (should) never occur.
        default: return StopLightUpdate.reset
        }
    }
}
