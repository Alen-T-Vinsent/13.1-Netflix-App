
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation
import SwiftUI

struct MovieResponse3:Decodable{
    let results:[Welcome]
    
//    private enum CodingKeys:String,CodingKey{
//        case movies = "results"
//    }
}


// MARK: - Welcome
struct Welcome: Decodable {
    //let adult: Bool
    var backdrop_path: String
    //let belongsToCollection: JSONNull?
    //let budget: Int
   // var genres: [Genre]
    //let homepage: String
    var id:Int
    var imdb_id: Int
    var original_title:String
    //let imdb_id, original_language, original_title, overview: String
   // let popularity: Double
    var poster_path: String
   // let productionCompanies: [ProductionCompany]
    //let productionCountries: [ProductionCountry]
   // let releaseDate: String
   // let revenue, runtime: Int
   // let spokenLanguages: [SpokenLanguage]
    //let status, tagline, title: String
   // let video: Bool
    //let voteAverage: Double
   // let voteCount: Int
//
//    enum CodingKeys: String, CodingKey {
//        case adult
//        case backdropPath = "backdrop_path"
//        case belongsToCollection = "belongs_to_collection"
//        case budget, genres, homepage, id
//        case imdbID = "imdb_id"
//        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
//        case overview, popularity
//        case posterPath = "poster_path"
//        case productionCompanies = "production_companies"
//        case productionCountries = "production_countries"
//        case releaseDate = "release_date"
//        case revenue, runtime
//        case spokenLanguages = "spoken_languages"
//        case status, tagline, title, video
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
//    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

//// MARK: - ProductionCompany
//struct ProductionCompany: Codable {
//    let id: Int
//    let logoPath: String?
//    let name, originCountry: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case logoPath = "logo_path"
//        case name
//        case originCountry = "origin_country"
//    }
//}
//
//// MARK: - ProductionCountry
//struct ProductionCountry: Codable {
//    let iso3166_1, name: String
//
//    enum CodingKeys: String, CodingKey {
//        case iso3166_1 = "iso_3166_1"
//        case name
//    }
//}
//
//// MARK: - SpokenLanguage
//struct SpokenLanguage: Codable {
//    let englishName, iso639_1, name: String
//
//    enum CodingKeys: String, CodingKey {
//        case englishName = "english_name"
//        case iso639_1 = "iso_639_1"
//        case name
//    }
//}

// MARK: - Encode/decode helpers

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
////    public required init(from decoder: Decoder) throws {
////        let container = try decoder.singleValueContainer()
////        if !container.decodeNil() {
////            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
////        }
////    }
//
////    public func encode(to encoder: Encoder) throws {
////        var container = encoder.singleValueContainer()
////        try container.encodeNil()
////    }
//}


class MovieStore3:ObservableObject{
    @Published var movies3:[Welcome]?
    
    func getAll(){
        guard let url = URL(string: "https://api.themoviedb.org/3/trending/all/day?api_key=0422c7e94450b39e40d25a3ed90bbc96")
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
                let tableData = try decoder.decode(MovieResponse3.self, from: data)
              print(tableData)
//                print("\n \n \n Rows in array: \(tableData.results.count)")
                print("\n \n \n \n \n \n \n page no = = \(tableData.results.count)")
//                DispatchQueue.main.async {
//                    self.movies3 = tableData.results
//                }
            }
            catch {
              print (error)
            }

            print(self.movies3 ?? "movies are nil why")
            print("here is movies")
        }
        .resume()
    }
}

