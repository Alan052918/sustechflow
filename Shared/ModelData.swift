//
//  ModelData.swift
//  SUSTech Flow
//
//  Created by Alan on 2021/1/19.
//

import Foundation

var flowGroups: [FlowGroup] = load("flowgroups.json")
var flowItems: [FlowItem] = load("flowitems.json")
var favoriteflowitems: [FavoriteFlowItem] = load("favoriteflowitems.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
