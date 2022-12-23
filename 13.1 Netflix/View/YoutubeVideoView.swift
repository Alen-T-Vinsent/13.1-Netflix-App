//
//  YoutubeVideoView.swift
//  13.1 Netflix
//
//  Created by Apple  on 23/12/22.
//

import SwiftUI

import SwiftUI
import WebKit

struct YoutubeVideoView: UIViewRepresentable {
     
    let videoID:String
    
    func makeUIView(context: Context) -> WKWebView{
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "http://www.youtube.com/embed/\(videoID)") else{
            return
        }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url:youtubeURL))
    }
    
    

}
