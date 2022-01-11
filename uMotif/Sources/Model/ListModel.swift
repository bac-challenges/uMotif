//
//  ListModel.swift
//  uMotif
//
//  Created by emile on 10/01/2022.
//

import Combine

protocol ListModelType: ServiceInjected, JSONDecoderInjected {
    func get(_ endpoint: EndPoint) -> AnyPublisher<[RemoteItem], Error>
}

struct ListModel: ListModelType {
    func get(_ endpoint: EndPoint) -> AnyPublisher<[RemoteItem], Error> {
        return service.get(endpoint)
            .decode(type: Response.self, decoder: jsonDecoder)
            .map(transformResponse)
            .eraseToAnyPublisher()
    }
}

// MARK: - Helpers
private extension ListModel {
    func transformResponse(_ response: Response) -> [RemoteItem] {
        return response.value
    }
}
