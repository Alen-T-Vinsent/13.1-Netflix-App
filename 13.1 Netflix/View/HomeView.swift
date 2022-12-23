//
//  HomeView.swift
//  13.1 Netflix
//
//  Created by Apple  on 15/12/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var store2 = MovieStore()
    @State var genre1:String = "batman"
    @State var genre2:String = "Hulk"
    @State var genre3:String = "movies"
    @State var trendingTmdbList:[TrendingResultCollection] = []
    @State var posterPaths:[String] = []
    @State var backDrop:String = "AokFVAl1JVooW1uz2V2vxNUxfit.jpg"
    @State var counter:Int = 0
    @State var presentYTSheet = false
    @State var youtubeVideoId:String = "ToXAt1v0LFk"
    @State var YTResult:String = ""
    @State var showAlert = false
    
    @State var json:Any = "json i  nil "
    
    //let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    var body: some View{
        GeometryReader{ screenSize in
            let global = screenSize.frame(in: .global)
            
            
            
            ScrollView(showsIndicators: false){
                ZStack(alignment:.leading){
                    
                    
                    VStack(spacing:30){
                        //                        Image("strangerThings")
                        //                            .resizable()
                        //                            .scaledToFit()
                        //                            .frame(width: screenSize.size.width,height: 600)
                        //                            .frame(maxWidth: .infinity)
                        //                            .clipped()
                        
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                ForEach(trendingTmdbList,id: \.id){each in
                                    ZStack(alignment:.bottom){
                                        URLImage(url:"https://image.tmdb.org/t/p/original/\(each.backdropPath)")
                                            .frame(width: screenSize.size.width,height: 550)
                                        
                                        
                                        HStack{
                                            
                                            Spacer()
                                            
                                            VStack{
                                                HStack{
                                                    Image(systemName: "plus")
                                                }
                                                HStack{
                                                    Text("My List")
                                                        .font(.caption2)
                                                }
                                            }
                                            .foregroundColor(Color.white)
                                            .padding()
                                            
                                            Spacer()
                                            
                                            Button {
                                                print("hello yt play")
                                                print(each.id)
                                                YTResult=""
                                                getYTVideoID(VideoId: each.id)
                                                
                                                presentYTSheet = true
                                                
                                                
                                            } label: {
                                                
                                                VStack(alignment:.center){
                                                    ///stack of play
                                                    HStack{
                                                        HStack{
                                                            Image(systemName: "play.fill")
                                                                .foregroundColor(Color.black)
                                                            
                                                        }
                                                        
                                                        HStack{
                                                            
                                                            Text("Play")
                                                                .font(.caption)
                                                            
                                                            
                                                            
                                                        }
                                                    }//Hstack play
                                                }
                                                .foregroundColor(Color.black)
                                                .background(Color.white)
                                                .frame(maxWidth:90,maxHeight: 30)
                                            }
                                            .alert("No Video Availble", isPresented: $showAlert) {
                                                        Button("Got it", role: .cancel) { }
                                                    }
//                                            .opacity(YTResult.isEmpty ? 1 : 0)
                                            
                                            .foregroundColor(Color.black)
                                            .background(Color.white)
                                            .cornerRadius(2)
                                            .frame(maxWidth:90,maxHeight: 30)
                                            
                                            Spacer()
                                            
                                            VStack{
                                                HStack{
                                                    Image(systemName: "info.circle")
                                                }
                                                HStack{
                                                    Text("Info")
                                                        .font(.caption)
                                                }
                                            }
                                            .foregroundColor(Color.white)
                                            .padding()
                                            
                                            Spacer()
                                            
                                        }
                                        
                                        .background(
                                            LinearGradient(gradient: Gradient(colors:[
                                                .black,
                                                .black.opacity(0)
                                            ]), startPoint: .bottom, endPoint: .top)                                        )
                                        .frame(maxWidth: .infinity,maxHeight: 50)
                                        
                                        
                                        
                                        
                                        
                                    }
                                    
                                    
                                    
                                    
                                }///zstack
                            }
                            
                            //                            .onReceive(timer) { time in
                            //                                self.posterPaths = trendingTmdbList.map { $0.posterPath }
                            //                                print("The time is now \(time)")
                            //                                print(counter)
                            //                                print(backDrop)
                            //                                if counter == trendingTmdbList.count - 1 {
                            //                                    counter = 0
                            //                                }else{
                            //                                    counter += 1
                            //                                }
                            //                            }
                        }
                        
                        .padding(.top)
                        
                        
                        Movie_Row(title: "You may also like",genre:genre3)
                            .padding(.bottom,60)
                        Movie_Row(title: "Batman",genre:genre1)
                            .padding(.bottom,10)
                        Movie_Row(title: "Hulk",genre:genre2)
                            .padding(.bottom,10)
                        Movie_Row(title: "Mummy", genre: "Mummy")
                            .padding(.bottom,100)
                        
                        
                        
                    }
                }
                
                
                
            }
            .sheet(isPresented: $presentYTSheet, content: {
                YoutubeVideoView(videoID: YTResult)
            })
            .onAppear(perform: {
                
                fetchRandomTrendingTMDB()
                fetchPosterPath()
            })
            
            .edgesIgnoringSafeArea(.top)
            
            navbar
                .background(
                    LinearGradient(gradient: Gradient(colors:[
                        .black,
                        .black.opacity(0)
                    ]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.top)
                )
            
        }
        .onAppear {
            
            //            DispatchQueue.main.async {
            //                fetchRandomTrendingTMDB()
            //                let quotes = Bundle.main.decode([TrendingTMDB].self, from: "quotes.json")
            //                quote = quotes.randomElement()
            //            }
        }
        .edgesIgnoringSafeArea(.top)
        .ignoresSafeArea()
    }
    
    
    var navbar:some View{
        HStack(spacing:20){
            VStack{
                HStack{
                    Image("netflixN")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                    
                    Spacer()
                    
                    Button {
                        print("aroow up logo")
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size:30))
                            .frame(width: 50,height: 50)
                            .foregroundColor(Color.white)
                    }
                    
                    
                    Button {
                        print("avatar clicked")
                    } label: {
                        Image("avatar3")
                            .resizable()
                            .frame(width: 30,height: 30)
                    }
                    .padding()
                    
                    
                }
                
                HStack(spacing:20){
                    Text("TV Shows")
                    Text("Movies")
                    //                    //Menu("Categories ^"){
                    //                        Button {
                    //                            print("")
                    //                        } label: {
                    //                            Text("Action")
                    //                        }
                    //
                    //                        Button {
                    //                            print("")
                    //                        } label: {
                    //                            Text("Drama")
                    //                        }
                    //
                    //                        Button {
                    //                            print("")
                    //                        } label: {
                    //                            Text("Comedy")
                    //                        }
                    //
                    //                        Button {
                    //                            print("")
                    //                        } label: {
                    //                            Text("Sci-Fi")
                    //                        }
                    //
                    //                        Button {
                    //                            print("")
                    //                        } label: {
                    //                            Text("Fantasy")
                    //                        }
                    //
                    //                    }
                    CategoryMenuView()
                        .accentColor(Color.white)
                    
                }
                
            }
            .padding(.top,60)
            
            //            .padding(.top,60)
            
            
        }
        .frame(height: 150)
        .frame(maxWidth: .infinity)
        
    }
    
    func fetchPosterPath(){
        posterPaths = trendingTmdbList.map{$0.backdropPath}
        print("show poster paths")
        print("show poster paths")
        print("show poster paths")
        print("show poster paths")
        print("show poster paths")
        print(posterPaths)
    }
    
    func fetchRandomTrendingTMDB(){
        print("On Home")
        let url = URL(string: "https://api.themoviedb.org/3/trending/all/day?api_key=0422c7e94450b39e40d25a3ed90bbc96")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            print("\(String(describing: trendingTmdbList))")
            let movieTitles = fetchMovieTitles(jsonData: data!)
        }.resume()
        
        
    }
    
    func fetchMovieTitles(jsonData: Data) -> [ResultCollection] {
        print("inside fetch movies titels")
        let decoder = JSONDecoder()
        print(jsonData)
        print(" i am  json data")
        let printableStrings = String(data: jsonData , encoding: .utf8)!
        
        print("printable string - - - - \(String(describing: printableStrings))")
        do {
            let movieResults = try decoder.decode(TrendingTMDB.self, from: jsonData)
            self.trendingTmdbList = movieResults.results
            
            return []
        } catch {
            print("Error decoding movie.results: \(error)")
            return []
        }
        
    }
    
    
    func getYTVideoID(VideoId:Int){
        let apiKey = "0422c7e94450b39e40d25a3ed90bbc96"
        let movieID = VideoId
        let endpoint = "https://api.themoviedb.org/3/movie/\(movieID)/videos?api_key=\(apiKey)"
        
        guard let url = URL(string: endpoint) else {
            // for handling invalid URL
            print("error getting url \(endpoint) getYTVideoID functon ")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                // for handle error
                print("error fetching data from url getYTVideoID functon \(error)" )
                return
            }
            print("here is url")
            print("\(url)")
            print("data is ready")
            print("data is ready")
            print("data is ready")
            print("data is ready")
            print("\(String(describing: data))")
            print("data is ready")
            
            
            guard let data = data else {
                // handle missing data
                print("data not available ")
                return
            }
            
            print("json data ")
            print("json data ")
            
            do {
                // try parsing the data
                self.json = try JSONSerialization.jsonObject(with: data, options: [])
                // use the parsed data in your SwiftUI code
            } catch {
                print("Error parsing data: \(error)")
                
            }
            
            print("\(json)")
            print("\(data)")
          
            print("ready to pase data")
            print("ready to pase data")
            print("ready to pase data")
            print("ready to pase data")
            print("ready to pase data")
            
            do {
                // parse the data
                let videoResponse = try JSONDecoder().decode(YtVideoID.self, from: data)
                DispatchQueue.main.async {
                    //youtubeVideoId = videoResponse.results[0].key
                    
                    
                    
                    if videoResponse.results == nil{
                        print("error no video or data there")
                    }else{
                        YTResult = videoResponse.results[0].key
                    }
                    

                }
                print("success parsing data")
                // sucess we can use video link from ytresult[0].key
            } catch {
                
                showAlert = true
                // handle error
                print("error parsing data in getYTVideoID")
                print("error parsing data in getYTVideoID")
                print("error parsing data in getYTVideoID")
                print("\(error.localizedDescription)")
                print("error parsing data in getYTVideoID")
                
                do {
                    // try parsing the data
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    // use the parsed data in your SwiftUI code
                } catch {
                    print("Error parsing data: \(error)")
                }
                
            }
        }.resume()
        
        
    }
    
    
}



// MARK: - YtVideoID
struct YtVideoID: Codable {
    let id: Int
    let results: [ResultYT]
}

// MARK: - Result
struct ResultYT: Codable {
    let name,key: String
}

enum ISO3166_1: String, Codable {
    case us = "US"
}

enum ISO639_1: String, Codable {
    case en = "en"
}

enum Site: String, Codable {
    case youTube = "YouTube"
}

enum TypeEnum: String, Codable {
    case behindTheScenes = "Behind the Scenes"
    case featurette = "Featurette"
    case teaser = "Teaser"
    case trailer = "Trailer"
}





// MARK: - TrendingTMDB
struct TrendingTMDB: Codable {
    let page: Int
    let results: [TrendingResultCollection]
    let totalPages, totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct TrendingResultCollection: Codable {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let title: String?
    let originalLanguage: OriginalLanguage
    let originalTitle: String?
    let overview, posterPath: String
    let mediaType: MediaType
    let genreIDS: [Int]
    let popularity: Double
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double
    let voteCount: Int
    let name, originalName, firstAirDate: String?
    let originCountry: [String]?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case name
        case originalName = "original_name"
        case firstAirDate = "first_air_date"
        case originCountry = "origin_country"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
    case ja = "ja"
    case ko = "ko"
}


//
////
////  HomeView.swift
////  13.1 Netflix
////
////  Created by Apple  on 15/12/22.
////
//
//import SwiftUI
//
//struct HomeView: View {
//    @StateObject var headerData = HeaderViewModel()
//
//    //disabling bouncing
//    init(){
//        UIScrollView.appearance().bounces = false
//    }
//    @StateObject var store2 = MovieStore()
//    @State var genre1:String = "batman"
//    @State var genre2:String = "Hulk"
//    @State var genre3:String = "movies"
//    @State var trendingTmdbList:[TrendingResultCollection] = []
//    var body: some View{
//        GeometryReader{ screenSize in
//            let global = screenSize.frame(in: .global)
//
//
//
//            ScrollView(showsIndicators: false){
//                ZStack(alignment:.leading){
//
//
//                    VStack(spacing:30){
////                        Image("strangerThings")
////                            .resizable()
////                            .scaledToFit()
////                            .frame(width: screenSize.size.width,height: 600)
////                            .frame(maxWidth: .infinity)
////                            .clipped()
//
//                        ScrollView(.horizontal,showsIndicators: false){
//                            HStack{
//                            ForEach(trendingTmdbList,id: \.id){each in
//
//
//                                    URLImage(url:"https://image.tmdb.org/t/p/original/\(each.backdropPath)")
//                                        .frame(width: screenSize.size.width,height: 500)
//                                        .ignoresSafeArea()
//
//                                }
//                            }
//                        }
//                        .offset(y:global.minY > 0 ? -global.minY : 0)
//
//
//                        Movie_Row(title: "You may also like",genre:genre3)
//                            .padding(.bottom,60)
//                        Movie_Row(title: "Batman",genre:genre1)
//                            .padding(.bottom,10)
//                        Movie_Row(title: "Hulk",genre:genre2)
//                            .padding(.bottom,10)
//                        Movie_Row(title: "Mummy", genre: "Mummy")
//                            .padding(.bottom,100)
//
//
//
//                    }
//                    .overlay(
//                        GeometryReader{proxy -> Color in
//
//                            let minY = proxy.frame(in: .global).minY
//
//                            //print(minY)
//
//                            DispatchQueue.main.async {
//
//                                //storing initial MinY value..
//                                if headerData.startMinY == 0{
//                                    headerData.startMinY = minY
//                                }
//                                //getting exact offset value by substracting current from start
//                                let offset = headerData.startMinY - minY
//
//
//                                //print("offset -- \(offset)")
//                                //getting scroll direction...
//
//                                if offset > headerData.offset{ //offset is defaulty 0
//                                    print("Top")
//                                    //if top hiding header
//
//                                    //same clearing bottom offset line m90
//                                    headerData.bottomScrolledOffset = 0
//
//                                    if headerData.topScrolledOffset == 0{
//                                        headerData.topScrolledOffset = offset
//                                    }
//                                    let progress = (headerData.topScrolledOffset + getMaxOffset() ) - offset
//                                   // print(progress)
//
//                                    let offsetCondition = (headerData.topScrolledOffset + getMaxOffset()) >= getMaxOffset() && getMaxOffset() - progress  <= getMaxOffset()
//
//                                    let headerOffset = offsetCondition ? -(getMaxOffset() - progress) : -getMaxOffset()
//
//                                    headerData.headerOffset = headerOffset
//
//                                    print(headerOffset)
//
//                                }
//
//
//                                if  offset < headerData.offset{
//                                    print("Bottom")
//                                    //if bottom revealing header
//
//                                    //clearing topScrollValue and setting bottom line m90
//
//                                    headerData.topScrolledOffset =  0
//
//                                    if headerData.bottomScrolledOffset == 0{
//                                        headerData.bottomScrolledOffset = offset
//                                    }
//
//                                    //Moving if little bit of screen is swiped down..
//                                    //for eg 40 offset...
//
//                                    withAnimation(.easeOut(duration: 0.25)){
//                                        let headerOffset = headerData.headerOffset
//                                        headerData.headerOffset = headerData.bottomScrolledOffset >= offset + 40 ? 0 : (headerOffset != -getMaxOffset() ? 0 : headerOffset)
//                                    }
//                                }
//
//                                headerData.offset = offset
//
//
//
//                            }
//                            return Color.clear
//                        }
//                            .frame(height: 0)
//                        ,alignment: .top
//
//                    )
//                }
//
//
//
//            }
//
//            .edgesIgnoringSafeArea(.top)
//
//            navbar
//                .zIndex(1)
//                .offset(y:headerData.headerOffset)
//                .background(
//                    LinearGradient(gradient: Gradient(colors:[
//                        .black,
//                        .black.opacity(0)
//                    ]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.top)
//                )
//
//        }
//        .onAppear {
//            fetchRandomTrendingTMDB()
//        }
//        .edgesIgnoringSafeArea(.top)
//        .ignoresSafeArea()
//    }
//
//
//    var navbar:some View{
//        HStack(spacing:20){
//            VStack{
//                HStack{
//                    Image("netflixN")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(height: 50)
//
//                    Spacer()
//
//                    Button {
//                        print("aroow up logo")
//                    } label: {
//                        Image(systemName: "square.and.arrow.up")
//                            .font(.system(size:30))
//                            .frame(width: 50,height: 50)
//                            .foregroundColor(Color.white)
//                    }
//
//
//                    Button {
//                        print("avatar clicked")
//                    } label: {
//                        Image("avatar3")
//                            .resizable()
//                            .frame(width: 30,height: 30)
//                    }
//
//
//                }
//
//                HStack(spacing:20){
//
//                    Text("TV Shows")
//                    Text("Movies")
//                    //                    //Menu("Categories ^"){
//                    //                        Button {
//                    //                            print("")
//                    //                        } label: {
//                    //                            Text("Action")
//                    //                        }
//                    //
//                    //                        Button {
//                    //                            print("")
//                    //                        } label: {
//                    //                            Text("Drama")
//                    //                        }
//                    //
//                    //                        Button {
//                    //                            print("")
//                    //                        } label: {
//                    //                            Text("Comedy")
//                    //                        }
//                    //
//                    //                        Button {
//                    //                            print("")
//                    //                        } label: {
//                    //                            Text("Sci-Fi")
//                    //                        }
//                    //
//                    //                        Button {
//                    //                            print("")
//                    //                        } label: {
//                    //                            Text("Fantasy")
//                    //                        }
//                    //
//                    //                    }
//                    CategoryMenuView()
//                        .accentColor(Color.white)
//
//                }
//
//            }
//            .padding(.top,60)
//
//            //            .padding(.top,60)
//
//
//        }
//        .frame(height: 150)
//        .frame(maxWidth: .infinity)
//
//    }
//
//    func fetchRandomTrendingTMDB(){
//        print("On Home")
//        let url = URL(string: "https://api.themoviedb.org/3/trending/all/day?api_key=0422c7e94450b39e40d25a3ed90bbc96")!
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            print("\(String(describing: trendingTmdbList))")
//            let movieTitles = fetchMovieTitles(jsonData: data!)
//        }.resume()
//
//    }
//    func fetchMovieTitles(jsonData: Data) -> [ResultCollection] {
//        print("inside fetch movies titels")
//        let decoder = JSONDecoder()
//        print(jsonData)
//        print(" i am  json data")
//        let printableStrings = String(data: jsonData , encoding: .utf8)!
//        print("chekc image")
//        print("chekc image")
//        print("chekc image")
//        print("chekc image")
//        print("chekc image")
//        print("chekc image")
//        print("chekc image")
//        print("printable string - - - - \(String(describing: printableStrings))")
//        do {
//            let movieResults = try decoder.decode(TrendingTMDB.self, from: jsonData)
//            self.trendingTmdbList = movieResults.results
//            return []
//        } catch {
//            print("Error decoding movie.results: \(error)")
//            return []
//        }
//
//    }
//
//    func getMaxOffset()->CGFloat{
//        return headerData.startMinY + (edges?.top ?? 0)+10
//    }
//
//}
//
//
//var edges = UIApplication.shared.windows.first?.safeAreaInsets
//
//var rect = UIScreen.main.bounds
//
//struct HeaderView:View{
//    @Environment(\.colorScheme) var scheme
//    var body: some View{
//        HStack(){
//            Image("YTlogo 1")
//                .resizable()
//                .aspectRatio(contentMode: ContentMode.fit)
//                .frame(width: 40,height: 50,alignment: .center)
//                .padding(.top,60)
//            Text("Youtube")
//                .font(.title3)
//                .fontWeight(.bold)
//                .foregroundColor(.primary)
//                .padding(.top,60)
//            //kerning
//                .kerning(0.5)
//
//            Spacer(minLength: 0)
//
//            Button {
//
//            } label: {
//                Image(systemName: "display")
//                    .font(.title)
//                    .foregroundColor(.primary)
//            }
//            .padding(.top,60)
//
//            Button {
//
//            } label: {
//                Image(systemName: "bell")
//                    .font(.title)
//                    .foregroundColor(.primary)
//            }
//            .padding(.top,60)
//
//            Button {
//
//            } label: {
//                Image(systemName: "magnifyingglass")
//                    .font(.title)
//                    .foregroundColor(.primary)
//            }
//            .padding(.top,60)
//
//            Button {
//
//            } label: {
//                Image(systemName: "person.and.background.dotted")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 30,height: 30)
//                    .foregroundColor(Color.primary)
//                    .clipShape(Circle())
//            }
//            .padding(.top,60)
//
//        }
//        .padding(.horizontal)
//        .padding(.vertical,8)
//        .background(Color.green)
//        .background(scheme == .dark ? Color.black : Color.white)
//        .ignoresSafeArea(.all,edges: .top)
//
//
//        //Divider
//        .overlay(
//            Divider()
//            ,alignment: .center
//        )
//    }
//}
//
//
//
//
//import Foundation
//
//// MARK: - TrendingTMDB
//struct TrendingTMDB: Codable {
//    let page: Int
//    let results: [TrendingResultCollection]
//    let totalPages, totalResults: Int
//
//    enum CodingKeys: String, CodingKey {
//        case page, results
//        case totalPages = "total_pages"
//        case totalResults = "total_results"
//    }
//}
//
//// MARK: - Result
//struct TrendingResultCollection: Codable {
//    let adult: Bool
//    let backdropPath: String
//    let id: Int
//    let title: String?
//    let originalLanguage: OriginalLanguage
//    let originalTitle: String?
//    let overview, posterPath: String
//    let mediaType: MediaType
//    let genreIDS: [Int]
//    let popularity: Double
//    let releaseDate: String?
//    let video: Bool?
//    let voteAverage: Double
//    let voteCount: Int
//    let name, originalName, firstAirDate: String?
//    let originCountry: [String]?
//
//    enum CodingKeys: String, CodingKey {
//        case adult
//        case backdropPath = "backdrop_path"
//        case id, title
//        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
//        case overview
//        case posterPath = "poster_path"
//        case mediaType = "media_type"
//        case genreIDS = "genre_ids"
//        case popularity
//        case releaseDate = "release_date"
//        case video
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
//        case name
//        case originalName = "original_name"
//        case firstAirDate = "first_air_date"
//        case originCountry = "origin_country"
//    }
//}
//
//enum MediaType: String, Codable {
//    case movie = "movie"
//    case tv = "tv"
//}
//
//enum OriginalLanguage: String, Codable {
//    case en = "en"
//    case es = "es"
//    case ja = "ja"
//    case ko = "ko"
//}
//
//
//
//import SwiftUI
//
//class HeaderViewModel: ObservableObject {
////to capture start MinY value for calculations....
//    @Published var startMinY:CGFloat = 0
//    @Published var offset:CGFloat = 0
//
//    //header view property
//    @Published var headerOffset:CGFloat = 0
//
//    //it will be used for getting top and bottom offsets for header view
//    @Published var topScrolledOffset:CGFloat = 0
//    @Published var bottomScrolledOffset:CGFloat = 0
//
//}
