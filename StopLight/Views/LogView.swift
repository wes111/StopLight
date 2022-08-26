//
//  LogView.swift
//  StopLight
//
//  Created by Wesley Luntsford on 8/25/22.
//

import SwiftUI

struct LogView: View {
    
    @ObservedObject var vm: StopLightViewModel
    
    var body: some View {
        VStack {
            ForEach(vm.record) { record in
                RecordView(record: record)
            }
        }
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        //LogView()
        EmptyView()
    }
}
