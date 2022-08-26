//
//  StopLightViewModel.swift
//  StopLight
//
//  Created by Wesley Luntsford on 8/25/22.
//

import Combine
import Foundation

class StopLightViewModel: ObservableObject {
    
    @Published var currentColor: StopLightColor = .green
    
    private var secondTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private var secondCount = 0 {
        // Reset to 0 when a cycle completes. No need to continue
        // counting up.
        didSet {
            if secondCount == StopLightColor.cycleDuration {
                secondCount = 0
            }
        }
    }
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        sinkColors()
    }

    func sinkColors() {
        secondTimer.sink { _ in
            self.secondCount += 1
            print(self.secondCount)
            if let color = StopLightColor.getColor(from: self.secondCount) {
                self.currentColor = color
                print("Current second: \(self.secondCount), color: \(color)")
            }
        }.store(in: &subscriptions)
    }
    
    func reset() {
        secondCount = 0
        currentColor = .green
        secondTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
}
