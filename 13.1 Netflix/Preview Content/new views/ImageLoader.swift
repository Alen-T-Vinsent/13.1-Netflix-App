//
//  ImageLoader.swift
//  13.4 netflix movie app
//
//  Created by Apple  on 14/12/22.
//

import Foundation

class ImageLoader:ObservableObject{
    @Published var downloadedData:Data?
    
    func downloadImage(url:String){
        guard let imageURL = URL(string: url) else{
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, errr in
            guard let data = data,errr == nil else{
                return
            }
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }
        .resume()
    }
}
