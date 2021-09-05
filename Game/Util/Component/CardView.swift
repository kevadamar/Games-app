//
//  CardView.swift
//  Game
//
//  Created by keva on 29/08/21.
//

import SwiftUI

struct CardView: View {
    var game: GameModel
    var body: some View {
        VStack(alignment: .center, spacing: 8, content: {
            ImageView(url: self.game.backgroundImage ?? "")
                .frame(height: 200)
                .cornerRadius(15)
            Text(self.game.name ?? "")
                .fontWeight(.medium)
                .foregroundColor(.gray)
                .font(.system(size: 18))
            HStack(alignment: .center, spacing: 16) {
                ImageLabelView(image: Image(systemName: "calendar"), text: dateFormat(dateStr: self.game.released ?? ""), color: .gray
                )
                ImageLabelView(image: Image(systemName: "timer"), text: "\(self.game.playtime ?? 0) min", color: .gray)
                ImageLabelView(image: Image(systemName: "star.fill"), text: "\(String(format: "%.1f", self.game.rating ?? 0))", color: .yellow)
            }
        })
    }
}
