//
//  StopLightView.swift
//  StopLight
//
//  Created by Wesley Luntsford on 8/25/22.
//

import SwiftUI

struct StopLightView: View {
    
    @Binding var currentColor: StopLightColor
    
    var body: some View {
        VStack(spacing: 50) {
            VStack(spacing: 10) {
                Image(systemName: "circle.fill")
                    .foregroundColor(currentColor == .red ? .red : .black)
                
                Image(systemName: "circle.fill")
                    .foregroundColor(currentColor == .yellow ? .yellow : .black)
                
                Image(systemName: "circle.fill")
                    .foregroundColor(currentColor == .green ? .green : .black)
            }
            .font(.system(size: 100))
            .padding(20)
            .border(.black, width: 10)
            
            Button {
                
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
        StopLightView(
            currentColor: .constant(StopLightColor.yellow)
        )
    }
}
