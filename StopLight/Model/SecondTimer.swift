//
//  SecondTimer.swift
//  StopLight
//
//  Created by Wesley Luntsford on 8/26/22.
//

import Combine
import Foundation

class SecondTimer: ObservableObject {
    
    // Publishes every second.
    var publisher = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    // Publishes timer resets.
    private let resetSubject = PassthroughSubject<StopLightRecord, Never>()

    func reset() {
        publisher = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        resetSubject.send(StopLightRecord(.reset))
    }
    
    func getResetPublisher() -> AnyPublisher<StopLightRecord, Never> {
        return self.resetSubject.eraseToAnyPublisher()
    }
}
