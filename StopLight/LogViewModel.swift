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
    
    override init(_ timer: SecondTimer) {
        super.init(timer)
        sinkSeconds()
        sinkResets()
    }
    
    // Sink timer resets and append those resets to
    // records.
    private func sinkResets() {
        timer.getResetPublisher().sink { record in
            self.records.append(record)
        }.store(in: &subscriptions)
    }

    // Sink seconds from the publisher and append
    // stoplight changes to records.
    private func sinkSeconds() {
        timer.publisher.sink { _ in
            self.secondCount += 1
            if let color = StopLightColor.getColor(from: self.secondCount) {
                self.records.append(StopLightRecord(.changed(color)))
            }
        }.store(in: &subscriptions)
    }
}
