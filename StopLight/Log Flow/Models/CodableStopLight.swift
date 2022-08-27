//
//  CodableStopLight.swift
//  StopLight
//
//  Created by Wesley Luntsford on 8/27/22.
//

import Foundation

// The model for storing stopLights in the database (UserDefaults).
struct CodableStopLight: Codable, Identifiable {
    let title: String
    let date: Date
    let id: UUID
    
    init(record: StopLightRecord) {
        self.id = record.id
        self.date = record.date
        self.title = record.update.description
    }
}
