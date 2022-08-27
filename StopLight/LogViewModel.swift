//
//  LogViewModel.swift
//  StopLight
//
//  Created by Wesley Luntsford on 8/26/22.
//

import Combine
import Foundation

class LogViewModel: TimerViewModel {
    
    @Published var records: [StopLightRecord] = []
    var dbManager = DatabaseManager()
    
    override init(_ timer: SecondTimer) {
        super.init(timer)
        sinkSeconds()
        sinkResets()
    }
    
    // We update the records held by the dbManager each
    // time a new record is received.
    private func sinkRecords() {
        $records.sink { _ in
            guard let record = self.records.last else { return }
            self.dbManager.appendRecord(using: record)
            self.dbManager.saveRecords()
        }.store(in: &subscriptions)
    }
    
    // Sink timer resets and append those resets to
    // records.
    private func sinkResets() {
        timer.getResetPublisher().sink { record in
            self.secondCount = 0
            self.records.append(record)
        }.store(in: &subscriptions)
    }

    // Sink seconds from the publisher and append
    // stoplight changes to records.
    private func sinkSeconds() {
        timer.publisher.sink { _ in
            self.secondCount += 1
            print(self.secondCount)
            if let color = StopLightColor.getColor(from: self.secondCount) {
                self.records.append(StopLightRecord(.changed(color)))
                print("Current second: \(self.secondCount), color: \(color)")
            }
        }.store(in: &subscriptions)
    }
}
