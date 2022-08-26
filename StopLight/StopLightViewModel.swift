//
//  StopLightViewModel.swift
//  StopLight
//
//  Created by Wesley Luntsford on 8/25/22.
//

import Combine
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


// Break this into 2 VMs and move the timer to its own class to be injected.
class StopLightViewModel: ObservableObject {
    
    @Published var currentColor: StopLightColor = .green
    @Published var record: [StopLightRecord] = []
    
    private var secondTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private var subscriptions = Set<AnyCancellable>()
    
    private var secondCount = 0 {
        // Reset to 0 when a cycle completes. No need to continue
        // counting up.
        didSet {
            if secondCount == StopLightColor.cycleDuration {
                secondCount = 0
            }
        }
    }
    
    init() {
        sinkColors()
    }

    private func sinkColors() {
        secondTimer.sink { _ in
            self.secondCount += 1
            print(self.secondCount)
            if let color = StopLightColor.getColor(from: self.secondCount) {
                self.currentColor = color
                self.record.append(StopLightRecord(.changed(color)))
                print("Current second: \(self.secondCount), color: \(color)")
            }
        }.store(in: &subscriptions)
    }
    
    func reset() {
        secondCount = 0
        currentColor = .green
        record.append(StopLightRecord(.reset))
        secondTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
}
