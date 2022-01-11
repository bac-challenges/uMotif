//
//  DIContainer.swift
//  uMotif
//
//  Created by emile on 10/01/2022.
//

import Foundation

// MARK: - InjectionMap
struct InjectionMap {
    static var listModel: ListModelType = ListModel()
    static var service: ServiceType = Service()
    static var jsonDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dataDecodingStrategy = .base64
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .millisecondsSince1970
        return decoder
    }
}

// MARK: ListModel
protocol ListModelInjected {}
extension ListModelInjected {
    var listModel: ListModelType { get { return InjectionMap.listModel } }
}

// MARK: Service
protocol ServiceInjected {}
extension ServiceInjected {
    var service: ServiceType { get { return InjectionMap.service } }
}

// MARK: JSONDecoder
protocol JSONDecoderInjected {}
extension JSONDecoderInjected {
    var jsonDecoder: JSONDecoder { get { return InjectionMap.jsonDecoder } }
}
