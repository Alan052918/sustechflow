//
//  FlowGroup.swift
//  SUSTech Flow
//
//  Created by Alan on 2021/1/19.
//

import Foundation
import SwiftUI

struct FlowGroup: Identifiable, Codable, Hashable {
    var id: Int
    var name: String
    var flowCount: Int
    var description: String

    private var symbolName: String
    var symbolImage: Image {
        Image(systemName: symbolName)
    }
}
