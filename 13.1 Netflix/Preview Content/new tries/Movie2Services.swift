////
////  Movie2Services.swift
////  13.1 Netflix
////
////  Created by Apple  on 14/12/22.
////
//
//import Foundation
//
//struct Movie2Services{
//    func fetchMovies(from endpoint:MovieList2EndPoint,completion:@escaping (Result<MovieResponse2,Movie2Error>)->()){
//        
//    }
//    func fetchMovie(id:Int,completion:@escaping (Result<Movie2,Movie2Error>) -> ()){
//        
//    }
//    func searchQuery(query:String,completion:@escaping (Result<MovieResponse2,Movie2Error>)-> ()){
//        
//    }
//}
//
//enum MovieList2EndPoint:String,CaseIterable{
//    case nowPlaying = "now_playing"
//    case upcoming
//    case topRated = "top_rated"
//    case popular
//    
//    var description:String{
//        switch self{
//        case .nowPlaying:return "Now Playing"
//        case .upcoming:return "Upcoming"
//        case .topRated:return "Top Rated"
//        case . popular:return "Popular"
//        }
//    }
//}
//
//
//enum Movie2Error:Error{
//    case apiError
//    case invalidResponse
//    case invalidEndPoint
//    case noData
//    case serializationError
//    
//    var localizedDescription:String{
//        switch self{
//        case .apiError:return "Failed to fetch data"
//        case .invalidEndPoint:return "Invalid end point"
//        case .invalidResponse:return "Invalid response"
//        case .noData:return "No data"
//        case .serializationError:return "Failed to decode data"
//        }
//    }
//    
//    var errorUserInfo:[String:Any]{
//        [NSLocalizedDescriptionKey:localizedDescription]
//    }
//}
