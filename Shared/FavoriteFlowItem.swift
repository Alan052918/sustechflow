//
//  FavoriteFlowItem.swift
//  SUSTech Flow
//
//  Created by Alan on 2021/1/20.
//

import Foundation
import SwiftUI


struct FavoriteFlowItem: Identifiable, Codable, Hashable {
    var id: Int
    var name: String
    var description: String
    var state: String

    private var symbolName: String
    var symbolImage: Image {
        Image(systemName: symbolName)
    }
}
