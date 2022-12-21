////////import SwiftUI
////////
////////struct DownloadsView: View {
////////
////////    //MARK: observedObject
////////    @ObservedObject var store3:MovieStore3
////////    @State private var hello:Any = ""
////////
////////    let data = (1...100).map { "Item \($0)" }
////////
////////    let columns = [
////////        GridItem(.adaptive(minimum: 80))
////////    ]
////////
////////    var body: some View {
////////        ScrollView {
////////            LazyVGrid(columns: columns, spacing: 20) {
////////                ForEach(data, id: \.self) { item in
////////                    Text(item)
////////                        .frame(width:60,height: 50)
////////                        .background(Color.green)
////////                }
////////            }
////////
////////            .padding(.horizontal)
////////
////////            //MARK: next lazy v grid
////////            ///after first green square views
//////////
//////////            LazyVGrid(columns: columns) {
//////////                ForEach(store3.movies3  ?? [Welcome](),id:\.imdb_id){ eachMovie in
//////////
//////////                    NavigationLink {
//////////                        MovieDetails(movieTitle: eachMovie.original_title, movieId: "", moviePoster: eachMovie.poster_path)
//////////                    } label: {
//////////                        VStack(spacing:30){
//////////                            URLImage(url:eachMovie.poster_path)
//////////                                .frame(width: 100,height: 150)
//////////                            Text("\(eachMovie.original_title)")
//////////                                .frame(maxHeight:.infinity,alignment:.top)
//////////                        }
//////////                    }
//////////
//////////
//////////                }
//////////
////////            }
////////
////////
////////
////////        }
////////        .onAppear(perform: {
////////            store3.getAll()
////////            print("- - - - - -")
////////            print("hello i am store3.getAll first")
////////            hello = printAllMovies()
////////            print("= = = \(hello) = = = ")
////////            print("- - - - - - ")
////////            print("hello i am store3.getAll last")
////////        })
////////        .frame(maxHeight: .infinity)
////////
////////
////////    }
////////
////////    func printAllMovies(){
////////        print("i am print all movies - - - - - ")
////////        for eachItem in store3.movies3 ?? [Welcome]() {
////////            print("each item -- -- -- -- \(eachItem.id)")
////////        }
////////    }
////////
////////}
//////
//////import SwiftUI
//////
//////struct MovieTMDB: Decodable {
//////    let page: Int
//////    let results: [Result]
//////
//////
//////    private enum CodingKeys: String, CodingKey {
//////
//////        case page,results
//////
//////    }
//////    init(from decoder: Decoder) throws {
//////        let container = try decoder.container(keyedBy: CodingKeys.self)
//////        page = try container.decode(Int.self, forKey: .page)
//////        results = try container.decode([Result].self, forKey: .results)
//////    }
//////
//////}
//////
//////
//////// MARK: - Result
//////struct Result: Decodable {
//////    let adult: Bool
//////    let backdropPath: String?
//////    let genreIDS: [Int]
//////    let id: Int
//////    let originalTitle, overview: String
//////    let popularity: Double
//////    let posterPath: String?
//////    let releaseDate, title: String
//////    let video: Bool
//////    let voteAverage: Double
//////    let voteCount: Int
//////
//////    enum CodingKeys: String, CodingKey {
//////        case adult
//////        case backdropPath = "backdrop_path"
//////        case genreIDS = "genre_ids"
//////        case id
//////        case originalLanguage = "original_language"
//////        case originalTitle = "original_title"
//////        case overview, popularity
//////        case posterPath = "poster_path"
//////        case releaseDate = "release_date"
//////        case title, video
//////        case voteAverage = "vote_average"
//////        case voteCount = "vote_count"
//////    }
//////
//////
//////    init(from decoder: Decoder) throws {
//////        let container = try decoder.container(keyedBy: CodingKeys.self)
//////        adult = try container.decode(Bool.self, forKey: .adult)
//////        backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
//////        genreIDS = try container.decode([Int].self, forKey: .genreIDS)
//////        id = try container.decode(Int.self, forKey: .id)
//////        originalTitle = try container.decode(String.self, forKey: .originalTitle)
//////        overview = try container.decode(String.self, forKey: .overview)
//////        popularity = try container.decode(Double.self, forKey: .popularity)
//////        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
//////        releaseDate = try container.decode(String.self, forKey: .releaseDate)
//////        title = try container.decode(String.self, forKey: .title)
//////        video = try container.decode(Bool.self, forKey: .video)
//////        voteAverage = try container.decode(Double.self, forKey: .voteAverage)
//////        voteCount = try container.decode(Int.self, forKey: .voteCount)
//////    }
//////
//////}
//////
//////
//////
//////struct DownloadsView: View {
//////    @State private var movies: [MovieTMDB] = []
//////    var body: some View {
////////        List(movies, id: \.results) { movie in
////////            VStack(alignment: .leading) {
////////                Text(movie.results)
////////                Text(movie.releaseDate)
////////                    .font(.subheadline)
////////                    .foregroundColor(.secondary)
////////            }
//////
//////
//////Text("hello downloads")
//////        .onAppear {
//////            print("On DownloadsView")
//////            let apiKey = "0422c7e94450b39e40d25a3ed90bbc96"
//////            let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=\(apiKey)&sort_by=popularity.desc")!
//////            URLSession.shared.dataTask(with: url) { (data, response, error) in
////////
////////                guard let data = data,error == nil else{
////////                    return
////////                }
////////
////////                let printableStrings = String(data: data , encoding: .utf8)!
////////                print("printable string - - - - \(String(describing: printableStrings))")
////////
////////                print("i am data \(data)")
//////               // let movies = try? JSONDecoder().decode([MovieTMDB].self, from: data)
//////
//////                print("before if let i am movie -  -  -  -  -  -  -  -")
//////                print("\(String(describing: movies))")
//////                print("before if let i am movie -  -  -  -  -  -  -  -")
//////
////////                if let movies = movies {
////////                    print("\n \n \n \n \n movies added self.movies")
////////                    self.movies = movies
////////                    print("\n \n \n \n \n movies added self.movies")
////////                }
//////
//////                if let data = data {
//////
//////                    let printableStrings = String(data: data , encoding: .utf8)!
//////                    print("printable string - - - - \(String(describing: printableStrings))")
//////
//////                    do {
//////                        let movies = try JSONDecoder().decode([MovieTMDB].self, from: data)
//////                        self.movies = movies
//////                    } catch {
//////                        print("Error decoding movies: \(error)")
//////                    }
//////                } else {
//////                    print("Data is nil")
//////                }
//////
//////                print("after if let i am movie -  -  -  -  -  -  -  -")
//////                print("\(String(describing: movies))")
//////                print("after if let i am movie -  -  -  -  -  -  -  -")
//////
//////            }.resume()
//////
//////            print("end of On appear in downloads View")
//////        }
//////    }
//////}
//////
////
////
////import Foundation
////
////struct Movie4: Codable,Identifiable {
////  let id: Int
////  let title: String
////  let overview: String
////  let posterPath: String
////}
////
////struct MovieResult4: Codable {
////  let results: [Movie4]
////}
////
////func fetchMovies(completion: @escaping ([Movie4]) -> Void) {
////  let apiKey = "YOUR_API_KEY_HERE"
////  let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)")!
////  let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
////    if let error = error {
////      print("Error fetching movies: \(error)")
////      return
////    }
////
////    guard let data = data else {
////      print("No data returned from API")
////      return
////    }
////
////    let decoder = JSONDecoder()
////    decoder.keyDecodingStrategy = .convertFromSnakeCase
////    do {
////      let results = try decoder.decode(MovieResult4.self, from: data)
////      completion(results.results)
////    } catch {
////      print("Error decoding movies: \(error)")
////    }
////  }
////  task.resume()
////}
////
////import SwiftUI
////
////struct DownloadsView: View {
////  @State private var movies: [Movie4] = []
////
////  var body: some View {
////    List(movies) { movie in
////      Text(movie.title)
////    }
////    .onAppear(perform: fetchMovies)
////  }
////
////  private func fetchMovies() {
////      _3_1_Netflix.fetchMovies{ [ self] movies in
////          self.movies = movies
////    }
////  }
////}
//
//
//import Foundation
//
//struct MovieResult: Codable {
//  let id: Int
//}
//
//struct MovieResults: Codable {
//  let page: Int
//  let results: [MovieResult]
//}
//
//
//
////print(movieIDs) // [1059031, 1037538, 1038672, 1042197, 1043144, 1043953, 1044420, 1044562, 1044823, 1046137]
//
//
//import SwiftUI
//
//struct DownloadsView: View {
//    @State var movieIDs: [Int] = []
//
//  var body: some View {
//      Text("{hello i am doen}")
//          .onAppear {
//              print(" i am on on appear downloads")
//              let jsonData = """
//              {"page":1,"results":[{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1059031,"original_language":"en","original_title":"Sherlock Holmes (Peter O'Toole) Collection","overview":"Sherlock Holmes animated films series starring Peter O'Toole.","popularity":0,"poster_path":null,"release_date":"","title":"Sherlock Holmes (Peter O'Toole) Collection","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1037538,"original_language":"fr","original_title":"La duologie Sudéris","overview":"","popularity":0,"poster_path":null,"release_date":"","title":"La duologie Sudéris","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1038672,"original_language":"en","original_title":"A man called - Collection","overview":"A man called Ove, A man called Otto","popularity":0,"poster_path":null,"release_date":"","title":"A man called - Collection","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1042197,"original_language":"en","original_title":"Star Trek: Enterprise Collection","overview":"Set 114 Years prior to Kirk's iconic 5-year mission in 2265, and 88 Years after the First Contact with the Vulans on April 5, 2063, Enterprise follows the first United Earth ship setting out to seek out new life, new civilizations, to boldly go where no man has gone before...","popularity":0,"poster_path":null,"release_date":"","title":"Star Trek: Enterprise Collection","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1043144,"original_language":"en","original_title":"Marvel Universe Collection","overview":"The complete Marvel collection","popularity":0,"poster_path":null,"release_date":"","title":"Marvel Universe Collection","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1043953,"original_language":"en","original_title":"The Marx Brothers Collection","overview":"Marx Brothers Movies","popularity":0,"poster_path":null,"release_date":"","title":"The Marx Brothers Collection","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1044420,"original_language":"fr","original_title":"La Trilogie du Dollar","overview":"","popularity":0,"poster_path":null,"release_date":"","title":"La Trilogie du Dollar","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1044562,"original_language":"en","original_title":"From Our Family to Yours","overview":"Disney celebrates the Holiday season spanning 3 years, in partnership with Make-A-Wish.","popularity":0,"poster_path":"/ghBTtkCpbeHqad52ytv0aSs5FFi.jpg","release_date":"","title":"From Our Family to Yours","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1044823,"original_language":"en","original_title":"FIA Formula One World Championship Season Review Collection","overview":"Sit back, strap in and relive the moments that made the FIA Formula One World Championship one of the most memorable in racing history.","popularity":0,"poster_path":null,"release_date":"","title":"FIA Formula One World Championship Season Review Collection","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1046137,"original_language":"en","original_title":"FIA Formula One World Championship Season Review Collection","overview":"End of Season Review","popularity":0,"poster_path":null,"release_date":"","title":"FIA Formula One World Championship Season Review Collection","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1046858,"original_language":"en","original_title":"Doctor Who: The Tenth Doctor Collection","overview":"The Tenth Doctor is the Eleventh and Twelfth Incarnation of the Time Lord only known as the Doctor.","popularity":0,"poster_path":null,"release_date":"","title":"Doctor Who: The Tenth Doctor Collection","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1055071,"original_language":"en","original_title":"Jackass","overview":"Jackass Movie Collection","popularity":0,"poster_path":null,"release_date":"","title":"Jackass","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1056107,"original_language":"ja","original_title":"ガチバンシリーズ","overview":"","popularity":0,"poster_path":null,"release_date":"","title":"ガチバンシリーズ","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":"/zT7GDvQl2zgs0p3Z2wGwxsaEjNZ.jpg","genre_ids":[14,12,16,35,10751],"id":9906,"original_language":"en","original_title":"The Ant Bully","overview":"Fed up with being targeted by the neighborhood bully, 10-year-old Lucas Nickle vents his frustrations on the anthill in his front yard ... until the insects shrink him to the size of a bug with a magic elixir. Convicted of \"crimes against the colony,\" Lucas can only regain his freedom by living with the ants and learning their ways.","popularity":23.166,"poster_path":"/oFuqX0inTvbA1XAFv2x3CQnI65m.jpg","release_date":"2006-07-28","title":"The Ant Bully","video":false,"vote_average":5.7,"vote_count":1177},{"adult":false,"backdrop_path":"/gwX3SeLU9vX3NYJPDW79Vn8bEJN.jpg","genre_ids":[16,35,10751],"id":9907,"original_language":"en","original_title":"Barnyard","overview":"When the farmer's away, all the animals play, and sing, and dance. Eventually, though, someone has to step in and run things, a responsibility that ends up going to Otis, a carefree cow.","popularity":21.83,"poster_path":"/qlSCUmrflADYlCMbkviJjfujhTH.jpg","release_date":"2006-08-04","title":"Barnyard","video":false,"vote_average":5.8,"vote_count":894},{"adult":false,"backdrop_path":"/8o1JywNXwJb6tLKe0N7mhjXQSPO.jpg","genre_ids":[53,18,80],"id":9908,"original_language":"de","original_title":"Tattoo","overview":"Marc Schrader, a rookie cop caught red-handed with drugs in a police raid of an illegal rave, joins a homicide investigation conducted by Chief Inspector Minks. The victim is a naked young woman with the skin stripped off her back, killed as she staggered into traffic. As Schrader and Minks investigate the murder, the case is complicated by a finger found in the stomach of the victim. Forensic examination proves the finger belongs to Nobert Günzel, who was previously convicted of rape and assault. The police raid Günzel’s residence, and discover a blood-stained table with restraints and bits of human flesh in his basement. They also find video equipment and preserved, tattooed skin from the victim’s back. Soon, they found dead bodies buried in the garden. Günzel then goes missing.","popularity":3.475,"poster_path":"/zM8eBp85uueFX02SEH5TySPevxu.jpg","release_date":"2002-04-04","title":"Tattoo","video":false,"vote_average":6.1,"vote_count":44},{"adult":false,"backdrop_path":"/nAnztzzsijB1CvAcFZATsTTP3tr.jpg","genre_ids":[18],"id":9909,"original_language":"en","original_title":"Dangerous Minds","overview":"Former Marine Louanne Johnson lands a gig teaching in a pilot program for bright but underachieving teens at a notorious inner-city high school. After having a terrible first day, she decides she must throw decorum to the wind. When Johnson returns to the classroom, she does so armed with a no-nonsense attitude informed by her military training and a fearless determination to better the lives of her students -- no matter what the cost.","popularity":19.645,"poster_path":"/yWHWC8fJRp2kLgiFrEa8o3krOH9.jpg","release_date":"1995-08-11","title":"Dangerous Minds","video":false,"vote_average":7,"vote_count":963}]
//
//              }
//              """.data(using: .utf8)!
//
//              let movieIDs = fetchMovieIDs(jsonData: jsonData)
//              print(movieIDs)
//              print("- - - - \n \n  i am  movieIDS above")
//              self.movieIDs = movieIDs
//              print(self.movieIDs)
//          }
//    List(movieIDs, id: \.self) { movieID in
//      Text("Movie ID: \(movieID)")
//    }
//
//  }
//
//
//    func fetchMovieIDs(jsonData: Data) -> [Int] {
//        print("inside fetch moview")
//      let decoder = JSONDecoder()
//      do {
//        let movieResults = try decoder.decode(MovieResults.self, from: jsonData)
//        let movieIDs = movieResults.results.map { $0.id }
//        return movieIDs
//      } catch {
//        print("Error decoding movie IDs: \(error)")
//        return []
//      }
//    }
//
//}
//

import Foundation

struct MovieResult: Codable {
  let title: String
}

struct MovieResults: Codable{
  let page: Int
  let results: [MovieResult]
}





import SwiftUI

struct DownloadsView: View {
  @State private var movieTitles: [Any] = []

  var body: some View {
      Text("heoooo")
//          .onAppear {
//              let jsonData = """
//              {
//                "page": 1,
//                "results": [
//                  { "title": "Sherlock Holmes (Peter O'Toole) Collection" },
//                  { "title": "La duologie Sudéris" },
//                  { "title": "A man called - Collection" },
//                  { "title": "Star Trek: Enterprise Collection" },
//                  { "title": "Marvel Universe Collection" },
//                  { "title": "The Marx Brothers Collection" },
//                  { "title": "La Trilogie du Dollar" },
//                  { "title": "From Our Family to Yours" },
//                  { "title": "FIA Formula One World Championship Season Review Collection" },
//                  { "title": "FIA Formula One World Championship Season Review Collection" }
//                ]
//              }
//              """.data(using: .utf8)!
//
//              let movieTitles = fetchMovieTitles(jsonData: jsonData)
//              print(movieTitles) // ["Sherlock Holmes (Peter O'Toole) Collection", "La duologie Sudéris", "A man called - Collection", "Star Trek: Enterprise Collection", "Marvel Universe Collection", "The Marx Brothers Collection", "La Trilogie du Dollar", "From Our Family to Yours", "FIA Formula One World Championship Season Review Collection", "FIA Formula One World Championship Season Review Collection"]
//          }
      
          .onAppear {
              print("On DownloadsView")
              let apiKey = "0422c7e94450b39e40d25a3ed90bbc96"
              let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=\(apiKey)&sort_by=popularity.desc")!
              URLSession.shared.dataTask(with: url) { (data, response, error) in
                  //
                  //                guard let data = data,error == nil else{
                  //                    return
                  //                }
                  //
                  //                let printableStrings = String(data: data , encoding: .utf8)!
                  //                print("printable string - - - - \(String(describing: printableStrings))")
                  //
                  //                print("i am data \(data)")
                  // let movies = try? JSONDecoder().decode([MovieTMDB].self, from: data)
                  
                  print("before if let i am movie -  -  -  -  -  -  -  -")
                  print("\(String(describing: movieTitles))")
                  print("before if let i am movie -  -  -  -  -  -  -  -")
                  
                  //                if let movies = movies {
                  //                    print("\n \n \n \n \n movies added self.movies")
                  //                    self.movies = movies
                  //                    print("\n \n \n \n \n movies added self.movies")
                  //                }
                  
//                  if let data = data {
//
//                      let printableStrings = String(data: data , encoding: .utf8)!
//                      print("printable string - - - - \(String(describing: printableStrings))")
//
//                      do {
//                          let movieTitles = try JSONDecoder().decode(MovieResults.self, from: data)
//                          self.movieTitles = movieTitles
//                      } catch {
//                          print("Error decoding movies: \(error)")
//                      }
//                  } else {
//                      print("Data is nil")
//                  }
//
//                  print("after if let i am movie -  -  -  -  -  -  -  -")
//                  print("\(String(describing: movieTitles))")
//                  print("after if let i am movie -  -  -  -  -  -  -  -")
                  
                  let movieTitles = fetchMovieTitles(jsonData: data!)
                                print(movieTitles)
              }.resume()
          }
      

  }
    func fetchMovieTitles(jsonData: Data) -> [Any] {
        print("inside fetch moveiw titels")
      let decoder = JSONDecoder()
      do {
        let movieResults = try decoder.decode(MovieResults.self, from: jsonData)
       // let movieTitles = movieResults.results.map { $0.title }
        return movieTitles
      } catch {
        print("Error decoding movie titles: \(error)")
        return []
      }
        
    }
    
}

