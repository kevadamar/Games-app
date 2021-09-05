//
//  GameDetailViewModel.swift
//  Game
//
//  Created by keva on 30/08/21.
//

import Foundation

class GameDetailViewModel: ObservableObject {
    private let gamesProtocol: GamesProtocol
    @Published var isLoading: Bool = true
    @Published var dataGame: GameModel?

    init(gamesProtocol: GamesProtocol = Api()) {
        self.gamesProtocol = gamesProtocol
    }
    func getGame(id: Int) {
        self.isLoading = true
        self.gamesProtocol.getGame(id: id) {(result) in
            DispatchQueue.main.async {
                self.dataGame = result
                self.isLoading = false
            }
        }
    }
}
