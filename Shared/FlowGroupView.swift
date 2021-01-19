//
//  FlowGroupView.swift
//  SUSTech Flow
//
//  Created by Alan on 2021/1/19.
//

import SwiftUI

struct FlowGroupView: View {
    var flowGroup: FlowGroup
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text(flowGroup.description)
        }
        .navigationTitle(flowGroup.name)
    }
}

struct FlowGroupView_Previews: PreviewProvider {
    static var previews: some View {
        FlowGroupView(flowGroup: flowGroups[0])
    }
}
