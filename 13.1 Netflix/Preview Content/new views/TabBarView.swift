import SwiftUI

struct TabBarView: View {
    @StateObject var store = MovieStore()
    @StateObject var store2 = MovieStore3()
    @State private var currentTab = 3
    var body: some View {
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
            
            TrendingView(store3: store2)
                .tabItem {
                    Image(systemName:"play.rectangle.on.rectangle.fill")
                        .foregroundColor(.white)
                }
                .tag(2)
//           Text("Downloads")
            DownloadsView()
                .tabItem {
                    Image(systemName:"arrow.down.to.line")
                        .foregroundColor(.white)
                }
                .tag(3)
            MenuView()
                .tabItem {
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(.white)
                }
                .tag(4)
            
            
        }
        
        
        
        
    }
}

