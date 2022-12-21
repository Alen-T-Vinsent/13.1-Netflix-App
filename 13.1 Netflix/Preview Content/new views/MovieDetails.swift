//
//  MovieDetails.swift
//  13.4 netflix movie app
//
//  Created by Apple  on 14/12/22.
//

import SwiftUI

struct MovieDetails: View {
    
    let movieTitle:String
    let movieId:String
    let moviePoster:String
    
    var body: some View {
        
        VStack(spacing:30){
//            Text("\(movieId)")
            URLImage(url: "\(moviePoster)")
                .frame(maxWidth: .infinity,maxHeight: 500)
            Text("\(movieTitle)")
                .frame(maxHeight:.infinity,alignment:.top)
        }
        .ignoresSafeArea()
        .foregroundColor(Color.white)
        
    }
}
