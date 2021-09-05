//
//  ProfileView.swift
//  Game
//
//  Created by keva on 29/08/21.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 184, height: 184, alignment: .center)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding(.top)
                VStack(alignment: .center) {
                    Text("Keva Damar Galih")
                        .bold()
                        .font(.title)
                    
                    Text("Mobile Developer")
                        .font(.footnote)
                    Link("Instagram", destination: URL(string: "https://www.instagram.com/kevadamar")!)
                        .font(.footnote)
                        .foregroundColor(.blue)
                        .padding(.horizontal)
                        .padding(.vertical)
                    Link("Github", destination: URL(string: "https://github.com/kevadamar")!)
                        .font(.footnote)
                        .foregroundColor(.blue)
                        .padding(.horizontal)
                        .padding(.vertical)
                }
                Spacer()
            }
        }
    }
}
