//
//  ListItem.swift
//  uMotif
//
//  Created by emile on 10/01/2022.
//

import Foundation

struct ListItem {

    let joke: String
    
    init(_ item: DataItem) {
        self.joke = item.joke
    }
}
