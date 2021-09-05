//
//  ImageLabelView.swift
//  Game
//
//  Created by keva on 05/09/21.
//

import SwiftUI

struct ImageLabelView: View {
    var image: Image
    var text: String
    var color: Color
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            self.image
                .foregroundColor(color)
                .frame(width: 16, height: 16, alignment: .center)
            Text(text)
                .foregroundColor(.gray)
                .font(.system(size: 10))
        }
    }

}
