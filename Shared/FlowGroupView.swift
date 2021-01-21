//
//  FlowGroupView.swift
//  SUSTech Flow
//
//  Created by Alan on 2021/1/19.
//

import SwiftUI

struct FlowItemCard: View {
    var flowItem: FlowItem

    var body: some View {
        VStack {
            HStack {
                flowItem.symbolImage
                Spacer()
//                Image(systemName: "gearshape.2")
            }
            .padding(.all, 7.0)
            Text(flowItem.name)
                .bold()
                .frame(width: 150, height: 50, alignment: .leading)
        }
        .background(RoundedRectangle(cornerRadius: 17.0, style: .continuous)
        .foregroundColor(.gray))
        .foregroundColor(.white)
        .cornerRadius(10.0)
    }
}

struct FlowItemCardDeck: View {
    var flowItems: [FlowItem]

    let columns = [GridItem(.adaptive(minimum: 150))]

    var body: some View {
        LazyVGrid(columns: columns, content: {
            ForEach(flowItems) { flowItem in
                NavigationLink(
                    destination: FlowItemView(flowItem: flowItem),
                    label: {
                        FlowItemCard(flowItem: flowItem)
                    })
            }
        })
        .padding(.horizontal, 15)
    }
}

struct FlowGroupView: View {
    var flowGroup: FlowGroup

    var body: some View {
        ScrollView {
            FlowItemCardDeck(flowItems: allFlowItems.filter { flowItem in
                flowItem.inGroup(flowGroup: flowGroup)
            })
        }
        .navigationTitle(flowGroup.name)
    }
}

struct FlowGroupView_Previews: PreviewProvider {
    static var previews: some View {
        FlowGroupView(flowGroup: allFlowGroups[0])
    }
}
