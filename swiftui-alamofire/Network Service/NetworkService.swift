//
//  NetworkService.swift
//  swiftui-alamofire
//
//  Created by Sachin Daingade on 10/07/24.
//

import Foundation
import Combine
import Alamofire

enum CustomError: Error {
    case invalidURL
    case customError(String)
}

protocol NetworkServiceProtocol {
    static func getPetsData() -> AnyPublisher<Pets,CustomError>
    
}

public struct NetworkService: NetworkServiceProtocol {
    static func getPetsData() -> AnyPublisher<Pets, CustomError> {
        let urlData = URL(string: "https://api.npoint.io/89bc67a9845e640ae6ce")
        return AF.request(urlData!, method: .get)
            .publishDecodable(type: Pets.self)
            .value()
            .mapError{error in CustomError.customError(error.localizedDescription)}
            .eraseToAnyPublisher()
    }
    
    
}



