import SwiftUI

struct SearchView: View {
    
    @ObservedObject var store1:MovieStore 
    
    let columns:[GridItem] = Array(repeating: .init(.flexible()), count: 3)
    var body: some View {
  
        NavigationView(content: {
            ScrollView {
                HStack {
                    TextField("Search", text: $store1.searchText)
                    Button(action: {
                        store1.getAll()
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
            
                }
                .padding()
                .cornerRadius(3)
                .background(Color.gray.opacity(0.2))
                
                LazyVGrid(columns: columns) {
                    ForEach(store1.movies  ?? [Movie](), id:\.imdbID){ eachMovie in
                        NavigationLink {
                            MovieDetails(movieTitle: eachMovie.Title, movieId: eachMovie.imdbID, moviePoster: eachMovie.Poster)
                        } label: {
                            VStack(spacing:30){
                                URLImage(url:eachMovie.Poster)
                                    .frame(width: 100,height: 150)
                                    .cornerRadius(6)
                                Text("\(eachMovie.Title)")
                                    .frame(maxHeight:.infinity,alignment:.top)
                            }
                        }
                    }
                    
                }
            }
            .padding()
            .navigationTitle(Text("Search"))
            .foregroundColor(Color.white)
            
        })
        //.searchable(text: $store1.searchText,prompt: "search here for movies....")
        .onAppear{
            store1.getAll()
        }
        
    }
}

