//
//  TimerViewModel.swift
//  StopLight
//
//  Created by Wesley Luntsford on 8/26/22.
//

import Combine
import Foundation

// Superclass to StopLightViewModel and LogViewModel
// for shared 'timer' viewModel functionality.
class TimerViewModel: ObservableObject {
    
    let timer: SecondTimer
    var subscriptions = Set<AnyCancellable>()
    
    init(_ timer: SecondTimer) {
        self.timer = timer
    }
    
    var secondCount = 0 {
        // Reset to 0 when a cycle completes. No need to continue
        // counting up.
        didSet {
            if secondCount == StopLightColor.cycleDuration {
                secondCount = 0
            }
        }
    }
}
