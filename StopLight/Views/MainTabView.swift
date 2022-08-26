//
//  MainTabView.swift
//  StopLight
//
//  Created by Wesley Luntsford on 8/25/22.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject var vm = StopLightViewModel()
    
    var body: some View {
        TabView {
            StopLightView(vm: vm)
                .tabItem {
                    Label("Stop Light", systemImage: "car.2.fill")
                }
            
            LogView(vm: vm)
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
