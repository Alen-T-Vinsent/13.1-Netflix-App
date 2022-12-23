//
//  URLImage.swift
//  13.4 netflix movie app
//
//  Created by Apple  on 14/12/22.
//

import SwiftUI

struct URLImage: View {
    
    let url:String
    let placeholder:String
    
    @ObservedObject var imageLoader1 = ImageLoader()
    
    init(url: String,placeholder:String = "NetflixWithBGBlack") {
        self.url = url
        self.placeholder = placeholder
        self.imageLoader1.downloadImage(url: self.url)
    }
    
    
    var body: some View {
        if let data = self.imageLoader1.downloadedData{
            return Image(uiImage: UIImage(data: data)!).renderingMode(.original).resizable()
        }else{
            return Image("NetflixWithBGBlack").renderingMode(.original).resizable()
        }
            
    }
}


