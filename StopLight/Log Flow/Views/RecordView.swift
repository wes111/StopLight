//
//  RecordView.swift
//  StopLight
//
//  Created by Wesley Luntsford on 8/26/22.
//

import SwiftUI

struct RecordView: View {
    
    let record: StopLightRecord
    
    var body: some View {
        VStack {
            Text(record.date.description)
            Text(record.update.description)
        }
        .padding()
        .border(Color.black, width: 2)
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView(record: StopLightRecord(.reset))
    }
}
