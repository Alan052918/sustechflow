//
//  MyFlowsView.swift
//  SUSTech Flow
//
//  Created by Alan on 2021/1/19.
//

import SwiftUI

struct FlowGroupRow: View {
    var flowGroup: FlowGroup

    var body: some View {
        HStack {
            flowGroup.symbolImage
                .resizable()
                .frame(width: 22, height: 20)
                .foregroundColor(.blue)
            Text(flowGroup.name)
            Spacer()
            Text("\(flowGroup.flowCount)")
                .foregroundColor(.gray)
        }
    }
}

struct FavoriteFlowItemView: View {
    var body: some View {
        Text("My favorite flow")
    }
}

struct MyFlowsView: View {
    @Environment(\.editMode) var editMode

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("groups")) {
                    ForEach(flowGroups) { flowGroup in
                        NavigationLink(
                            destination: FlowGroupView(flowGroup: flowGroup),
                            label: {
                                FlowGroupRow(flowGroup: flowGroup)
                            })
                    }
                }
                Section(header: Text("favorites")) {
                    ForEach(favoriteflowitems) {favoriteflowItem in
                        NavigationLink(
                            destination: FlowItemView(),
                            label: {
                                FavoriteFlowItemView()
                            })
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("SUSTech Flow")
            .navigationBarItems(
                leading: EditButton()
            )
        }
    }
}

struct MyFlowsView_Previews: PreviewProvider {
    static var previews: some View {
        MyFlowsView()
    }
}
