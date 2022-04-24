//
//  Gif.swift
//  wwdc playground
//
//  Created by Marina Cristina Marques dos santos on 10/04/22.
//

import SwiftUI
import WebKit

struct Gif: UIViewRepresentable {
    private let resourceName: String
    
    init(_ resourceName: String) {
        self.resourceName = resourceName
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let wView = WKWebView()
        let url = Bundle.main.url(forResource: resourceName, withExtension: "gif")!
        let data = try! Data(contentsOf: url)
        
        wView.load(data,
                   mimeType: "image/gif",
                   characterEncodingName: "UTF-8",
                   baseURL: url.deletingLastPathComponent())
        
        return wView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }
}

