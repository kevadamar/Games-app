//
//  SearchBarView.swift
//  Game
//
//  Created by keva on 29/08/21.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var query: String
    @State private var editing = false
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.purple)
            Text("|")
                .foregroundColor(.purple)
            TextField("Search Games", text: $query, onEditingChanged: { edit in
                self.editing = edit
            })
        }
        .padding(12)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundColor(Color.purple))
        .padding(8)
    }
}

struct MyTextFieldStyle: TextFieldStyle {
    @Binding var focused: Bool
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(5)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(focused ? Color.red : Color.gray, lineWidth: 1)
            )
    }
}
