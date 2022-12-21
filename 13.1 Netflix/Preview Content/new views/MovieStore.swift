//
//  MovieStore.swift
//  13.4 netflix movie app
//
//  Created by Apple  on 14/12/22.
//

import Foundation
import SwiftUI

struct MovieResponse : Decodable{
    let movies:[Movie]
    
    private enum CodingKeys:String,CodingKey{
        case movies = "Search"
    }
}

struct Movie:Decodable{
    let imdbID:String
    let Title:String
    let Poster:String
    
//    private enum Codingkeys:String,CodingKey{
//        case imdbID
//        case title = "Title"
//        case poster = "Poster "
//    }
}

class MovieStore:ObservableObject{
    @Published var movies:[Movie]?
    @Published var searchText:String = "spiderman"
    
    func getAll(){
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(searchText)&page=2&apikey=c843d71e")
        else {
//            print("invalid url")
            fatalError("Invalid url")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,error == nil else{
                return
            }
          
            
            let printableStrings = String(data: data , encoding: .utf8)!
            print("printable string - - - - \(String(describing: printableStrings))")
            
            
            do {
              let decoder = JSONDecoder()
             // let tableData = try decoder.decode(MovieResponse.self, from: data)
                let tableData = try decoder.decode(MovieResponse.self, from: data)
              print(tableData)
                print("\n \n \n Rows in array: \(tableData.movies.count)")
                
                DispatchQueue.main.async {
                    self.movies = tableData.movies
                }
            }
            catch {
              print (error)
            }

            
            
            
//            let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
//            if let movieResponse = movieResponse{
//                DispatchQueue.main.async {
//                    print(self.movies ?? "movies are nil why")
//                    self.movies = movieResponse.movies
//                }
//
//            }
//
            print(self.movies ?? "movies are nil why")
            print("here is movies")
        }
        .resume()
    }
}
