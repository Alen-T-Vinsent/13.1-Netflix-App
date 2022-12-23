//import SwiftUI
//
//struct TrendingView: View {
//    @ObservedObject var store3:MovieStore3
//    //@ObservedObject var store3:Welcome
//    let columns:[GridItem] = Array(repeating: .init(.flexible()), count: 3)
//    var body: some View {
//
//        NavigationView(content: {
//            ScrollView {
//
//                LazyVGrid(columns: columns){
//                    ForEach(store3.movies3  ?? [Welcome](),id:\.imdb_id){ eachMovie in
//
//                        NavigationLink {
//                            MovieDetails(movieTitle: eachMovie.original_title, movieId: "", moviePoster: eachMovie.poster_path)
//                        } label: {
//                            VStack(spacing:30){
//                                URLImage(url:eachMovie.poster_path)
//                                    .frame(width: 100,height: 150)
//                                Text("\(eachMovie.original_title)")
//                                    .frame(maxHeight:.infinity,alignment:.top)
//                            }
//                        }
//
//
//                    }
//
//                }
//
//
//
//                ForEach(store3.movies3 ?? [Welcome](),id:\.imdb_id){ eachItem in
//                    List {
//                        Text("\(eachItem.original_title)")
//
//                    }
//                }
//
//
//                List(1...10,id:\.self){hei in
//                    Text("\(hei)")
//                }
//                Text("hello i am coming soon")
//            }
//            .navigationTitle("Movies Api ")
//        })
//        .onAppear{
//            print("/n ------ \n ------ /n------ \n i am movies api tmdb")
//            store3.getAll()
//            printAllMovies()
//
//        }
//    }
//
//    func printAllMovies(){
//        for eachItem in store3.movies3 ?? [Welcome]() {
//            print("each item -- -- -- -- \(eachItem.imdb_id)")
//        }
//    }
//}

import Foundation
import SwiftUI




struct ResultCollection1: Decodable {
    
    
    
    
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

struct MovieTMDB1: Decodable {
    let page: Int
    let results: [ResultCollection1]
    
    private enum CodingKeys: String, CodingKey {
        case page
        case results
    }
    
}





import SwiftUI

struct TrendingView: View {
    
    @State private var movies: [ResultCollection1] = []
    @State private var showDetailViewTMDB = false
    @State private var idDetails:ResultCollection1 = ResultCollection1(adult: false, backdropPath: Optional("/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg"), genreIds: [28, 14, 878], id: 436270, originalLanguage: "en", originalTitle: "Black Adam", overview: "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.", popularity: 3189.94, posterPath: Optional("/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg"), releaseDate: "2022-10-19", title: "Black Adam", video: false, voteAverage: 7.2, voteCount: 3170)
    
    
    var body: some View {
        NavigationView {
            
            ScrollView{
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(movies, id: \.id) { each in
                        
                        
                        
                        VStack(alignment:.leading){
                            
                            Spacer()
                            VStack{
                                Text("\(each.title)")
                                    .shadow(radius: 1)
                                    .frame(alignment: .center)
                                    .frame(maxWidth:.infinity)
                                    .frame(height: 70)
                            }
                            
                            .background(
                                LinearGradient(gradient: Gradient(colors:[
                                    .black.opacity(0.7),
                                    .black.opacity(0)
                                ]), startPoint: .bottom, endPoint: .top)
                                
                            )
                            
                        }
                        .frame(width:200 ,height: 200)
                        .background(
                            
                            URLImage(url:"https://image.tmdb.org/t/p/original/\(each.backdropPath ?? "")")
                                .frame(maxWidth: .infinity,maxHeight: .infinity)
                                .foregroundColor(Color.red)
                        )
                        .onTapGesture {
                            print(each)
                            DispatchQueue.main.async {
                                idDetails = each
                            }
                            showDetailViewTMDB = true
                        }
                        .sheet(isPresented: $showDetailViewTMDB, content:{
                            DetailViewTMDB(EveryDetails:self.$idDetails)
                        })
                    }
                }
                .padding(10)
            }
            .navigationTitle("On Trending")
            
            
            
            
        }
        .onAppear {
            print("On DownloadsView")
            let apiKey = "0422c7e94450b39e40d25a3ed90bbc96"
            let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=\(apiKey)&sort_by=popularity.desc")!
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                print("before if let i am movie -  -  -  -  -  -  -  -")
                print("\(String(describing: movies))")
                print("before if let i am movie -  -  -  -  -  -  -  -")
                
                fetchMovieTitles(jsonData: data!)
                print("i am on trending")
                print("i am on trending")
                print("i am on trending")
                print("i am on trending")
                print("i am on trending")
                print("i am on trending")
                
            }.resume()
        }
        
    }
    
    func fetchMovieTitles(jsonData: Data) -> [ResultCollection1] {
        print("inside fetch movies titels")
        let decoder = JSONDecoder()
        print(jsonData)
        print(" i am  json data")
        let printableStrings = String(data: jsonData , encoding: .utf8)!
        print("printable string - - - - \(String(describing: printableStrings))")
        do {
            let movieResults = try decoder.decode(MovieTMDB1.self, from: jsonData)
            self.movies = movieResults.results
            return movieResults.results
        } catch {
            print("Error decoding movie.results: \(error)")
            return []
        }
        
    }
    
}

