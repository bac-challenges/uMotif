//
//  Service.swift
//  uMotif
//
//  Created by emile on 10/01/2022.
//

import Foundation
import Combine

protocol EndPointType {
    var url: URL? { get }
}

protocol ServiceType {
    func get(_ endpoint: EndPointType) -> AnyPublisher<Data, Error>
}

struct Service: ServiceType {
    func get(_ endpoint: EndPointType) -> AnyPublisher<Data, Error> {
        
        guard let url = endpoint.url else { fatalError("BAD URL")}
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError { $0 as Error }
            .map(\.data)
            .eraseToAnyPublisher()
    }
}
