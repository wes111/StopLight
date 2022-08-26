//
//  LogView.swift
//  StopLight
//
//  Created by Wesley Luntsford on 8/25/22.
//

import SwiftUI

struct LogView: View {
    
    @ObservedObject var vm: LogViewModel
    
    var body: some View {
        ScrollView {
            ForEach(vm.records) { record in
                RecordView(record: record)
            }
            .padding(10)
        }
        .padding(30)
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView(vm: LogViewModel(SecondTimer()))
    }
}
