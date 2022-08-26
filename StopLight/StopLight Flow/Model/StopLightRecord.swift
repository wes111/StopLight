//
//  StopLightRecord.swift
//  StopLight
//
//  Created by Wesley Luntsford on 8/26/22.
//

import Foundation

struct StopLightRecord: Identifiable {
    var id: Date {
        return self.date
    }
    
    let date = Date()
    let update: StopLightUpdate
    
    init(_ update: StopLightUpdate) {
        self.update = update
    }
}
