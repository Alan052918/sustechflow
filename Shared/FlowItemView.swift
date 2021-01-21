//
//  FlowItemView.swift
//  SUSTech Flow
//
//  Created by Alan on 2021/1/20.
//

import SwiftUI

struct FlowItemView: View {
    var flowItem: FlowItem

    var body: some View {
        Text(flowItem.description)
            .navigationTitle(flowItem.name)
    }
}

struct FlowItemView_Previews: PreviewProvider {
    static var previews: some View {
        FlowItemView(flowItem: allFlowItems[0])
    }
}
