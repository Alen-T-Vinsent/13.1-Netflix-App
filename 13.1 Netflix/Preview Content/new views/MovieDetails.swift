import SwiftUI

struct MovieDetails: View {
    
    let movieTitle:String
    let movieId:String
    let moviePoster:String
    
    var body: some View {
        
        VStack(spacing:30){
//            Text("\(movieId)")
            URLImage(url: "\(moviePoster)")
                .frame(maxWidth: .infinity,maxHeight: 500)
            Text("\(movieTitle)")
                .frame(maxHeight:.infinity,alignment:.top)
        }
        .ignoresSafeArea()
        .foregroundColor(Color.white)
        
    }
}
