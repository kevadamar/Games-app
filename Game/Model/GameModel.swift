//
//  GameModel.swift
//  Game
//
//  Created by keva on 29/08/21.
//

import Foundation

struct ResponseGameModel: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [GameModel]
}

// swiftlint:disable colon
struct GameModel: Codable, Identifiable {
    let id: Int?
    let description: String?
    let backgroundImage: String?
    let name: String?
    let released: String?
    let rating: Double?
    let playtime : Int?
    enum CodingKeys: String, CodingKey {
        case id, name, released, description
        case backgroundImage = "background_image"
        case rating, playtime
    }
}
