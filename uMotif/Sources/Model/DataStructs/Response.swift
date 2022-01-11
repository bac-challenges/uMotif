//
//  Response.swift
//  uMotif
//
//  Created by emile on 10/01/2022.
//

import Foundation

struct Response: Codable {
    let type: String
    let value: [RemoteItem]
}
