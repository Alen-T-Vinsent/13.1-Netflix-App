import Foundation
import SwiftUI

struct ResultCollection: Decodable {
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct MovieTMDB: Decodable {
    let page: Int
    let results: [ResultCollection]
    
    private enum CodingKeys: String, CodingKey {
        case page
        case results
    }
    
}





import SwiftUI

struct DownloadsView: View {
    @State private var movies: [ResultCollection] = []
    
    
    var body: some View {
        NavigationView {
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(movies,id: \.id) {movie in
                        AdvancedCardView(movie:movie)
                            .padding()
                            .frame(width: 200,height: 200)
                    }
                }
            }
            
            List(movies,id:\.id) { movie in
                HStack{
                    Text(movie.originalTitle)
                    Text("\(movie.id)")
                        .font(.callout)
                }
                AdvancedCardView(movie:movie)
                
                
            }
            .navigationTitle("Popular")
        }
        .onAppear {
            print("On DownloadsView")
            let apiKey = "0422c7e94450b39e40d25a3ed90bbc96"
            let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=\(apiKey)&sort_by=popularity.desc")!
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                print("before if let i am movie -  -  -  -  -  -  -  -")
                print("\(String(describing: movies))")
                print("before if let i am movie -  -  -  -  -  -  -  -")
                
                let movieTitles = fetchMovieTitles(jsonData: data!)
                print("= = = = = = =  i am movies ")
                print("= = = = = = =  i am movies ")
                print("= = = = = = =  i am movies ")
                print("= = = = = = =  i am movies ")
                print("= = = = = = =  i am movies ")
                print("= = = = = = =  i am movies ")
                print("= = = = = = =  i am movies ")
                print("= = = = = = =  i am movies ")
                print(movieTitles)
                print("= = = = = = =  i am movies ")
                print("= = = = = = =  i am movies ")
                print("= = = = = = =  i am movies ")
                print("= = = = = = =  i am movies ")
                print("= = = = = = =  i am movies ")
                print("= = = = = = =  i am movies ")
                print("= = = = = = =  i am movies ")
            }.resume()
        }
        
    }
    
    
    
    
    
    func fetchMovieTitles(jsonData: Data) -> [ResultCollection] {
        print("inside fetch movies titels")
        let decoder = JSONDecoder()
        print(jsonData)
        print(" i am  json data")
        let printableStrings = String(data: jsonData , encoding: .utf8)!
        print("printable string - - - - \(String(describing: printableStrings))")
        do {
            let movieResults = try decoder.decode(MovieTMDB.self, from: jsonData)
            self.movies = movieResults.results
            return movieResults.results
        } catch {
            print("Error decoding movie.results: \(error)")
            return []
        }
        
    }
    
}


struct AdvancedCardView: View {
    @State var movie:ResultCollection
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.red)
                .shadow(radius: 10)
            VStack(alignment: .leading, spacing: 20) {
                Text("\(movie.title)")
                    .font(.title)
                Text("\(movie.originalTitle)")
                    .font(.subheadline)
            }
            .padding()
            .frame(maxWidth: 200,maxHeight: 200)
            .background(Color.orange)
            
        }
        .cornerRadius(10)

        .frame(width: 200,height: 200)
        
    }
}

