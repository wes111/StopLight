//
//  MainTabView.swift
//  StopLight
//
//  Created by Wesley Luntsford on 8/25/22.
//

import SwiftUI

struct MainTabView: View {
    
    // A shared timer.
    let timer = SecondTimer()
    
    var body: some View {
        TabView {
            StopLightView(vm: StopLightViewModel(timer))
                .tabItem {
                    Label("Stop Light", systemImage: "car.2.fill")
                }
            
            LogView(vm: LogViewModel(timer))
                .tabItem {
                    Label("Log", systemImage: "pencil")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
