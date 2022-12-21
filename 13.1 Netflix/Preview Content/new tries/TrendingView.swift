import SwiftUI

struct TrendingView: View {
    @ObservedObject var store3:MovieStore3
    //@ObservedObject var store3:Welcome
    let columns:[GridItem] = Array(repeating: .init(.flexible()), count: 3)
    var body: some View {
    
        NavigationView(content: {
            ScrollView {

                LazyVGrid(columns: columns) {
                    ForEach(store3.movies3  ?? [Welcome](),id:\.imdb_id){ eachMovie in
                        
                        NavigationLink {
                            MovieDetails(movieTitle: eachMovie.original_title, movieId: "", moviePoster: eachMovie.poster_path)
                        } label: {
                            VStack(spacing:30){
                                URLImage(url:eachMovie.poster_path)
                                    .frame(width: 100,height: 150)
                                Text("\(eachMovie.original_title)")
                                    .frame(maxHeight:.infinity,alignment:.top)
                            }
                        }
                        
                        
                    }
                    
                }
                
                
                
                ForEach(store3.movies3 ?? [Welcome](),id:\.imdb_id){ eachItem in
                    List {
                        Text("\(eachItem.original_title)")
                        
                    }
                }
                
                
                List(1...10,id:\.self){hei in
                    Text("\(hei)")
                }
                Text("hello i am coming soon")
            }
            .navigationTitle("Movies Api ")
        })
        .onAppear{
            print("/n ------ \n ------ /n------ \n i am movies api tmdb")
            store3.getAll()
            printAllMovies()
            
        }
    }
    
    func printAllMovies(){
        for eachItem in store3.movies3 ?? [Welcome]() {
            print("each item -- -- -- -- \(eachItem.imdb_id)")
        }
    }
}
