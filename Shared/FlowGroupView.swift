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
                Image(systemName: "gearshape.2")
            }
            .padding(.all, 7.0)
            Text(flowItem.name)
                .bold()
                .frame(width: 150, height: 50, alignment: .leading)
//                .padding(.all, 7.0)
        }
        .background(RoundedRectangle(cornerRadius: 17.0, style: .continuous)
                        .foregroundColor(.gray))
//        .background(RadialGradient(
//                        gradient: Gradient(colors: [Color.gray, Color.black]),
//                        center: .center,
//                        startRadius: 5,
//                        endRadius: 600))
        .foregroundColor(.white)
        .cornerRadius(10.0)
    }
}

struct FlowItemCardDeck: View {
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

    var gridLayout = GridItem(.adaptive(minimum: 20, maximum: 50))

    var body: some View {
        ScrollView {
            FlowItemCardDeck()
        }
        .navigationTitle(flowGroup.name)
    }
}

struct FlowGroupView_Previews: PreviewProvider {
    static var previews: some View {
        FlowGroupView(flowGroup: flowGroups[0])
    }
}
