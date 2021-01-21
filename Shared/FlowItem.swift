//
//  FlowItem.swift
//  SUSTech Flow
//
//  Created by Alan on 2021/1/19.
//

import Foundation
import SwiftUI

enum FlowItemState: String, Codable {
    case active, inactive
}

struct FlowItem: Identifiable, Codable, Hashable {
    let id = UUID()
    var name: String
    var description: String
    var groupName: String
    var isFavorite: Bool

    var state: FlowItemState

    private var symbolName: String
    var symbolImage: Image {
        Image(systemName: symbolName)
    }

    private enum CodingKeys: String, CodingKey {
        case name, description, groupName, isFavorite, state, symbolName
    }

    func inGroup(flowGroup: FlowGroup) -> Bool {
        if flowGroup.name == "All Flows" {
            return true
        }
        return self.groupName == flowGroup.name
    }
}
