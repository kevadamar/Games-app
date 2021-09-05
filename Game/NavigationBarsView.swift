//
//  ContentView.swift
//  Game
//
//  Created by keva on 18/08/21.
//

import SwiftUI

struct NavigatonBarsView: View {
    var body: some View {
            TabView {
                GamesView()
                    .tabItem {
                        Image(systemName: "command")
                        Text("Games")
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    }
            }.accentColor(.purple)
    }
}
