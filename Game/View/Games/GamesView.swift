//
//  GamesView.swift
//  Game
//
//  Created by keva on 29/08/21.
//

import SwiftUI

struct GamesView: View {
    @ObservedObject var gamesViewModel = GamesViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                SearchBarView(query: self.$gamesViewModel.query)
                if gamesViewModel.isLoading {
                    Spacer()
                    VStack {
                        Text("Loading . . .")
                    }
                    Spacer()
                } else {
                    if !self.gamesViewModel.dataGames.isEmpty {
                        List(self.gamesViewModel.dataGames) { game in
                            ZStack {
                                CardView(game: game)
                                    .padding(.bottom, 20)
                                NavigationLink(destination: GameDetailView(id: game.id ?? 1)) {
                                    EmptyView()
                                }.buttonStyle(PlainButtonStyle())
                            }
                        }
                    } else {
                        Spacer()
                        VStack {
                            Text("Games Empty.")
                        }
                        Spacer()
                    }
                }
            }
            .onAppear {
                self.gamesViewModel.getGames()
            }
            .navigationTitle("All Games")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
