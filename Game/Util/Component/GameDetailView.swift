//
//  GameDetailView.swift
//  Game
//
//  Created by keva on 30/08/21.
//

import SwiftUI

struct GameDetailView:  View {
    @ObservedObject var gameDetailViewModel = GameDetailViewModel()
    var id: Int
    init(id: Int) {
        self.id = id
    }
    var body: some View {
        VStack {
            if self.gameDetailViewModel.dataGame != nil {
                GameDetailUI(gameDetailViewModel: self.gameDetailViewModel, game: self.gameDetailViewModel.dataGame!)
            } else {
                VStack {
                    Text("Loading. . .")
                }
            }
        }
        .onAppear(perform: {
            self.gameDetailViewModel.getGame(id: self.id)
        })
        .navigationBarTitle("Detail", displayMode: .inline)
    }
}

struct GameDetailUI: View {
    @ObservedObject var gameDetailViewModel: GameDetailViewModel
    var game: GameModel
    var body: some View {
        ScrollView {
            VStack {
                if self.game.backgroundImage != nil {
                    ImageView(url: self.game.backgroundImage ?? "")
                        .frame(height: 200)
                        .cornerRadius(15)
                        .padding()
                }
                VStack(alignment: .leading, spacing: 16) {
                    HStack(alignment: .center, spacing: 16) {
                        ImageLabelView(image: Image(systemName: "calendar"), text: dateFormat(dateStr: self.game.released ?? ""), color: .gray)
                        ImageLabelView(image: Image(systemName: "timer"), text: "\(self.game.playtime ?? 0) min", color: .gray)
                        ImageLabelView(image: Image(systemName: "star.fill"), text: "\(self.game.rating ?? 0)", color: .yellow)
                        Spacer()
                    }
                    Text(self.game.name ?? "")
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                        .italic()
                        .foregroundColor(.gray)
                    VStack {
                        ConvertHTMLView(htmlString: self.game.description!)
                            .frame(minHeight: 200, maxHeight: .infinity)
                    }
                }
                .padding([.leading, .trailing], 16)
                .padding([.top, .bottom], 8)
                Spacer()
            }
        }
    }
}
