//
//  RemoteItem.swift
//  uMotif
//
//  Created by emile on 10/01/2022.
//

import Foundation

struct RemoteItem: Codable, DataItem {
    let id: Int
    let joke: String
    let categories: [String]
}
