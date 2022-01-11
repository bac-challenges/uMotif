//
//  EndPoint.swift
//  uMotif
//
//  Created by emile on 10/01/2022.
//

import Foundation

enum EndPoint: EndPointType {
    
    case remote(_ count: Int)
    case mock
    
    var url: URL? {
        switch self {
        case .remote(let count): return URL(string: "http://api.icndb.com/jokes/random/\(count)?exclude=[explicit]")
        case .mock: return URL(fileURLWithPath: Bundle.main.path(forResource: "MockData", ofType: "json") ?? "")
        }
    }
}
