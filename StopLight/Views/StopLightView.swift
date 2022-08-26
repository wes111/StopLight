//
//  StopLightView.swift
//  StopLight
//
//  Created by Wesley Luntsford on 8/25/22.
//

import SwiftUI

struct StopLightView: View {
    @StateObject var vm = StopLightViewModel()
    
    var body: some View {
        VStack(spacing: 50) {
            VStack(spacing: 10) {
                Image(systemName: "circle.fill")
                    .foregroundColor(vm.currentColor == .red ? .red : .black)
                
                Image(systemName: "circle.fill")
                    .foregroundColor(vm.currentColor == .yellow ? .yellow : .black)
                
                Image(systemName: "circle.fill")
                    .foregroundColor(vm.currentColor == .green ? .green : .black)
            }
            .font(.system(size: 100))
            .padding(20)
            .border(.black, width: 10)
            
            Button {
                vm.reset()
            } label: {
                Text("Restart")
                    .font(.system(size: 40))
                    .padding(10)
                    .border(.green, width: 5)
            }
        }
    }
}

struct StopLightView_Previews: PreviewProvider {
    static var previews: some View {
        StopLightView()
    }
}
