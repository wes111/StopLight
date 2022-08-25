//
//  MainTabView.swift
//  StopLight
//
//  Created by Wesley Luntsford on 8/25/22.
//

import SwiftUI

struct MainTabView: View {
    
    @State var color = StopLightColor.green
    
    var body: some View {
        TabView {
            StopLightView(currentColor: $color)
                .tabItem {
                    Label("Stop Light", systemImage: "car.2.fill")
                }
            
            LogView()
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
