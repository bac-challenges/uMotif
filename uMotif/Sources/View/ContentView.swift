//
//  ContentView.swift
//  uMotif
//
//  Created by emile on 10/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var model = ListViewModel()
    
    var body: some View {
        List(model.items, id: \.joke) { item in
            Text(item.joke)
        }
        .navigationBarTitle("Jokes")
        .onAppear(perform: model.get)
    }
}
