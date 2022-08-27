//
//  LogView.swift
//  StopLight
//
//  Created by Wesley Luntsford on 8/25/22.
//

import SwiftUI

enum RecordsTab {
    case current
    case previous
}

struct LogView: View {
    
    @ObservedObject var vm: LogViewModel
    @State private var selectedTab: RecordsTab = .current
    
    var body: some View {
        VStack {
            Picker("", selection: $selectedTab) {
                Text("Current").tag(RecordsTab.current)
                Text("Previous").tag(RecordsTab.previous)
            }
            .pickerStyle(.segmented)
            
            if selectedTab == .current {
                ScrollView {
                    ForEach(vm.records) { record in
                        RecordView(record: record)
                    }
                    .padding(10)
                }
                .padding(30)
            } else {
                ScrollView {
                    ForEach(vm.dbManager.fetchRecords()) { record in
                        RecordView(record: record)
                    }
                    .padding(10)
                }
                .padding(30)
            }
        }
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView(vm: LogViewModel(SecondTimer()))
    }
}
