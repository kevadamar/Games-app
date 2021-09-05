//
//  ImageView.swift
//  Game
//
//  Created by keva on 29/08/21.
//

import SwiftUI

struct ImageView: View {
    private enum LoadState {
        case loading, success, failure, local
    }
    
    private class Loader: ObservableObject {
        var data = Data()
        var state = LoadState.loading
        
        init(url: String) {
            if let parsedURL = URL(string: url)  {
                
                URLSession.shared.dataTask(with: parsedURL) { data, response, error in
                    if let data = data, !data.isEmpty {
                        self.data = data
                        self.state = .success
                    } else {
                        self.state = .failure
                    }
                    DispatchQueue.main.async {
                        self.objectWillChange.send()
                    }
                }.resume()
            } else {
                self.state = .local
            }
        }
    }
    @StateObject private var loader: Loader
    var loading: Image
    var failure: Image
    var body: some View {
        GeometryReader { geo in
            selectImage()
                .resizable()
                .frame(width: geo.size.width)
        }
    }
    init(url: String, loading: Image = Image(systemName: "photo"), failure: Image = Image(systemName: "multiply.circle")) {
        _loader = StateObject(wrappedValue: Loader(url: url))
        self.loading = loading
        self.failure = failure
    }
    private func selectImage() -> Image {
        switch loader.state {
        case .loading:
            return loading
        case .failure:
            return failure
        case .local:
            return Image(systemName: "photo")
        default:
            if let image = UIImage(data: loader.data) {
                return Image(uiImage: image)
            } else {
                return failure
            }
        }
    }
}
