//
//  GamesViewModel.swift
//  Game
//
//  Created by keva on 29/08/21.
//

import Foundation

class   GamesViewModel: ObservableObject {
    private let gamesProtocol: GamesProtocol
    @Published var isLoading: Bool = true
    @Published var dataGames: [GameModel] = []
    @Published var query: String = "" {
        didSet {
            self.getGames()
        }
    }
    init(gamesProtocol: GamesProtocol = Api()) {
        self.gamesProtocol = gamesProtocol
    }
    func getGames() {
        self.isLoading = true
        self.gamesProtocol.getAllGames(query: self.query) { (dataGames) in
            DispatchQueue.main.async {
                self.dataGames = dataGames
                self.isLoading = false
            }
        }
    }
}
