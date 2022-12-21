//
//  Movie Row.swift
//  13.1 Netflix
//
//  Created by Apple  on 15/12/22.
//

import SwiftUI

struct Movie_Row: View {
    
    @StateObject var objMovieStore = MovieStore()
    @State var title:String
    @State var genre:String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size:22,weight: .bold,design: .rounded))
                .foregroundColor(.white)
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing: 20) {
                    ForEach(objMovieStore.movies  ?? [Movie](), id:\.imdbID){ eachMovie in
                        NavigationLink {
                            MovieDetails(movieTitle:eachMovie.Title, movieId: eachMovie.imdbID, moviePoster: eachMovie.Poster)
                        } label: {
                            URLImage(url:eachMovie.Poster)
                                .frame(width: 140,height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                        }

                        
                    }
                }
                .padding(.horizontal,5)
            }
        }
        .onAppear{
            objMovieStore.searchText = genre
            objMovieStore.getAll()
        }
    }
}

