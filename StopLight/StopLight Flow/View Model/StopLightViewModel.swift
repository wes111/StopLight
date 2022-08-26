//
//  StopLightViewModel.swift
//  StopLight
//
//  Created by Wesley Luntsford on 8/25/22.
//

import Combine
import Foundation

class StopLightViewModel: TimerViewModel {
    
    @Published var currentColor: StopLightColor = .green
    
    override init(_ timer: SecondTimer) {
        super.init(timer)
        sinkSeconds()
    }
    
    // Sink seconds from the publisher and update
    // currentColor if the stoplight should change.
    private func sinkSeconds() {
        timer.publisher.sink { _ in
            self.secondCount += 1
            print(self.secondCount)
            if let color = StopLightColor.getColor(from: self.secondCount) {
                self.currentColor = color
                print("Current second: \(self.secondCount), color: \(color)")
            }
        }.store(in: &subscriptions)
    }
    
    // Reset the stoplight and the timer.
    func reset() {
        secondCount = 0
        currentColor = .green
        timer.reset()
    }
}
