//
//  Api.swift
//  Game
//
//  Created by keva on 29/08/21.
//

import Foundation

typealias GamesCompletionType = (_ List: [GameModel]) -> Void
typealias GameCompletionType = (GameModel) -> Void
protocol GamesProtocol {
    func getAllGames(query: String?, completion: @escaping GamesCompletionType)
    func getGame(id: Int, completion: @escaping GameCompletionType)
}

class Api: GamesProtocol {
    private let baseUrl = "https://api.rawg.io/api/"
    private let apiKey = "6d7cf963708f47309fe30bfecb6fbd68"
    private let urlSession = URLSession.shared
    func getAllGames(query: String?, completion: @escaping GamesCompletionType) {
        var components = URLComponents(string: baseUrl + "games")!
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey)
        ]
        if let searchQuery = query, !searchQuery.isEmpty {
            components.queryItems?.append(URLQueryItem(name: "search", value: searchQuery))
        }
        let request = URLRequest(url: components.url!)
        urlSession.dataTask(with: request ) { data, _, error in
            if let errorResponse = error {
                print("Error response : \(errorResponse.localizedDescription)")
                completion([])
            } else {
                do {
                    let result = try JSONDecoder().decode(ResponseGameModel.self, from: data!)
                    if result.results.isEmpty {
                        completion([])
                    } else {
                        completion(result.results)
                    }
                } catch let error {
                    completion([])
                    print("Failed to get games : \(error)")
                }
            }
        }.resume()
    }
    func getGame(id: Int, completion: @escaping GameCompletionType) {
        var components = URLComponents(string: baseUrl + "games/" + String(id))!
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey)
        ]
        let request = URLRequest(url: components.url!)
        urlSession.dataTask(with: request ) { data, _, error in
            if let errorResponse = error {
                print("Error response : \(errorResponse.localizedDescription)")
            } else {
                do {
                    let result = try JSONDecoder().decode(GameModel.self, from: data!)
                    completion(result)
                } catch let error {
                    print("Failed to get games : \(error)")
                }
            }
        }.resume()
    }
}
