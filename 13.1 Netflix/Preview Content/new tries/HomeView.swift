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
    var body: some View {
        GeometryReader{ screenSize in
            
            ScrollView(showsIndicators: false){
                ZStack(alignment:.leading){
                
                    VStack(alignment:.center){
                        Text("Hello")
                            .padding(.top,50)
                            .background(Color.red)
                    }
                    
                    VStack(spacing:30){
                        Image("strangerThings")
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenSize.size.width,height: 600)
                            .frame(maxWidth: .infinity)
                            .clipped()
                        
                        
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
            
            navbar
                .background(
                    LinearGradient(gradient: Gradient(colors:[
                        .black.opacity(0.97),
                        .black.opacity(0.9),
                        .black.opacity(0.8),
                        .black.opacity(0.7),
                        .black.opacity(0)
                    ]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.top)
                )
            
        }
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
                    
                    
                }
                
                HStack(spacing:20){
                    
                    Text("TV Shows")
                    Text("Movies")
                    Menu("Categories ^"){
                        Button {
                            print("")
                        } label: {
                            Text("Action")
                        }
                        
                        Button {
                            print("")
                        } label: {
                            Text("Drama")
                        }
                        
                        Button {
                            print("")
                        } label: {
                            Text("Comedy")
                        }
                        
                        Button {
                            print("")
                        } label: {
                            Text("Sci-Fi")
                        }
                        
                        Button {
                            print("")
                        } label: {
                            Text("Fantasy")
                        }
                        
                    }
                    .accentColor(Color.white)
                    
                }
                
            }
            .padding(.top,60)
            
            //            .padding(.top,60)
            
            
        }
        .frame(height: 150)
        .frame(maxWidth: .infinity)
        
    }
    
    
}
