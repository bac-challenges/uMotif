//
//  ListViewModel.swift
//  uMotif
//
//  Created by emile on 10/01/2022.
//

import Foundation
import Combine

final class ListViewModel: ObservableObject, ListModelInjected {
    
    @Published var items = [ListItem]()
    
    private var disposables: Set<AnyCancellable> = []
    
    private let count = 100
}

// MARK: - Actions
extension ListViewModel {
    func get() {
        listModel.get(.remote(count))
            .receive(on: DispatchQueue.main)
            .replaceError(with: [])
            .map(transform)
            .assign(to: \.items, on: self)
            .store(in: &disposables)
    }
}

// MARK: - Helpers
private extension ListViewModel {
    func transform(_ items: [DataItem]) -> [ListItem] {
        items.map { item in
            ListItem(item)
        }
    }
}
