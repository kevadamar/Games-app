//
//  ConvetHTMLView.swift
//  Game
//
//  Created by keva on 05/09/21.
//

import SwiftUI
import WebKit

struct ConvertHTMLView: UIViewRepresentable {
    let htmlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlString, baseURL: nil)
    }
}
