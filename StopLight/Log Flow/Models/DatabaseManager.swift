//
//  DatabaseManager.swift
//  StopLight
//
//  Created by Wesley Luntsford on 8/27/22.
//

import Foundation

struct DatabaseManager {
    
    private var currentRecords: [CodableStopLight] = []
    private var previousRecords: [CodableStopLight]
    private static let key = "stoplightRecords"
    
    init() {
        self.previousRecords = DatabaseManager.fetchCodableRecords()
    }
    
    // Append a new record to currentRecords.
    mutating func appendRecord(using record: StopLightRecord) {
        self.currentRecords.append(CodableStopLight(record: record))
    }
    
    // Save the records to UserDefaults, overwriting previously saved data.
    func saveRecords() {
        let stopLightData = try! PropertyListEncoder().encode(currentRecords)
        UserDefaults.standard.set(stopLightData, forKey: DatabaseManager.key)
    }
    
    // Return previousRecords as an array of StopLightRecords
    func fetchRecords() -> [StopLightRecord] {
        return self.previousRecords.map { StopLightRecord(using: $0) }
    }
    
    // Fetch previously saved records.
    private static func fetchCodableRecords() -> [CodableStopLight] {
        let fetchedData = UserDefaults.standard.data(forKey: DatabaseManager.key)
        guard let fetchedData = fetchedData else { return [] }
        let fetchedRecords = try? PropertyListDecoder().decode([CodableStopLight].self, from: fetchedData)
        return fetchedRecords ?? []
    }
}
