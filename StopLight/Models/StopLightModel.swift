//
//  StopLightModel.swift
//  StopLight
//
//  Created by Wesley Luntsford on 8/25/22.
//

import Combine
import Foundation

class StopLightModel {
    
    let greenTimer = Timer.publish(every: 11, on: .main, in: .common)
    let yellowTimer = Timer.publish(every: 11, on: .main, in: .common)
    let redTimer = Timer.publish(every: 11, on: .main, in: .common)
    
    private var greenSubscription: Cancellable?
    private var yellowSubscription: Cancellable?
    private var redSubscription: Cancellable?
    
    init() {
    }
    
    func startTimers() {
        greenSubscription = greenTimer.connect()
        
        let greenDuration = DispatchTimeInterval.seconds(StopLightColor.green.duration)
        DispatchQueue.main.asyncAfter(deadline: .now() + greenDuration) {
            self.yellowSubscription = self.yellowTimer.connect()
        }
        
        let yellowDuration = DispatchTimeInterval.seconds(StopLightColor.yellow.duration)
        DispatchQueue.main.asyncAfter(deadline: .now() + yellowDuration + greenDuration) {
            self.redSubscription = self.redTimer.connect()
        }
    }
    
    func stopTimers() {
        greenSubscription?.cancel()
        greenSubscription = nil
        
        yellowSubscription?.cancel()
        yellowSubscription = nil
        
        redSubscription?.cancel()
        redSubscription = nil
    }
}
