import SwiftUI

struct TabBarView: View {
    @StateObject var store = MovieStore()
    @StateObject var store2 = MovieStore3()
    @State private var currentTab = 2
    var body: some View{
        TabView(selection:$currentTab){
            HomeView()
                .tabItem {
                    Image(systemName:"house.fill")
                        .foregroundColor(.white)
                }
                .tag(0)
            SearchView(store1: store)
                .tabItem {
                    Image(systemName:"magnifyingglass")
                        .foregroundColor(.white)
                }
                .tag(1)
            
            TrendingView()
                .tabItem {
//                    Image(systemName:"play.rectangle.on.rectangle.fill")
                    Image(systemName: "flame")
                        .foregroundColor(.white)
                }
                .tag(2)
//           Text("Downloads")
//            DownloadsView()
            Test()
                .tabItem {
                    Image(systemName:"arrow.down.to.line")
                        .foregroundColor(.orange)
                }
                .tag(3)
            MenuView()
                .tabItem {
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(.white)
                }
                .tag(4)
            
            
        }
        .accentColor(Color.red)
        
        
        
        
        
    }
}

