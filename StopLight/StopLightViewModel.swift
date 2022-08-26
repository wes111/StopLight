//
//  StopLightViewModel.swift
//  StopLight
//
//  Created by Wesley Luntsford on 8/25/22.
//

import Combine

class StopLightViewModel: ObservableObject {
    
    @Published var currentColor: StopLightColor = .green
    let model = StopLightModel()
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        sinkTimers()
        resetStopLight()
    }
    
    func resetStopLight() {
        currentColor = .green
        model.stopTimers()
        model.startTimers()
    }
    
    private func sinkTimers() {
        model.greenTimer.sink { date in
            self.currentColor = .green
        }.store(in: &subscriptions)
        
        model.yellowTimer.sink { date in
            self.currentColor = .yellow
        }.store(in: &subscriptions)
        
        model.redTimer.sink { date in
            self.currentColor = .red
        }.store(in: &subscriptions)
    }
}
