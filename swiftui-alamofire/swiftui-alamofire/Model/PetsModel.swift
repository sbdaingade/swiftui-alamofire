//
//  PetsModel.swift
//  swiftui-alamofire
//
//  Created by Sachin Daingade on 10/07/24.
//

import Foundation

// MARK: - Pets
struct Pets: Codable {
    let pets: [Pet]
}

// MARK: - Pet
struct Pet: Codable,Identifiable {
    var id = UUID()
    let title: String
    let imageURL: String
    let dateAdded: String
    let contentURL: String

    enum CodingKeys: String, CodingKey {
        case title
        case imageURL = "image_url"
        case dateAdded = "date_added"
        case contentURL = "content_url"
    }
}
