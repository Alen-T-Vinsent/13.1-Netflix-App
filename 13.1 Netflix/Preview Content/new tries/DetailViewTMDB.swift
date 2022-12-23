import SwiftUI

struct DetailViewTMDB: View {
    @Binding var EveryDetails:ResultCollection1
    @State var showYTScreen:Bool = false
    @State var json:Any?
    @State var YTResult:String = ""
    @State var ytID:String = ""
    @State var showAlert:Bool = false
    @State var videoID:String = ""
    
    
    var body: some View {
        ScrollView{
            HStack{
                URLImage(url:"https://image.tmdb.org/t/p/original/\(EveryDetails.backdropPath!)")
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                
            }
            .ignoresSafeArea(.all)
            
            VStack(spacing:15){
                HStack{
                    Text("\(EveryDetails.title)")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                }
                .frame(maxWidth:.infinity)
                .frame(alignment: .bottom)
                
                HStack{
                    VStack{
                        Text("\(EveryDetails.originalTitle)")
                            .font(.system(size: 13))
                    }
                    
                    
                    VStack{
                        Text("|  Release date : \(EveryDetails.releaseDate)")
                            .font(.system(size: 13))
                        
                    }
                    
                    Spacer()
                    
                }///Hstack with title and release date
                .frame(alignment: .center)
                .frame(height: 25)
                
                
                
                Button(action: {
                    print("yt play Detail db hstack DetailViewTMDB")
                    
                    //self.YTResult = []
                    YTResult = ""
                    getYTVideoID(VideoId: EveryDetails.id)
                    
                    
//                    if self.YTResult != nil{
//                        print("yt is not nil")
//                        print("\(self.YTResult)")
//                       // self.videoID = self.YTResult![0].key
//                        //showYTScreen = true
//                        print("yt is not nil end of if")
//                    }else{
//                        print("yt is niilllllllll")
//                        showAlert = true
//                    }
                    
                    print("yt active")
                    showYTScreen = true
                    
                }, label: {
                    HStack{
                        Image(systemName: "play.fill")
                        Text("Play")
                    }
                })
                
                .frame(maxWidth: .infinity)
                .frame(alignment: .center)
                .padding(.vertical,10)
                .background(Color.white)
                .foregroundColor(Color.black)
                .frame(height: 30)
                
                HStack{
                    Image(systemName: "arrow.down.to.line.alt")
                    Text("Downloads")
                    
                    
                }
                .frame(maxWidth: .infinity)
                .frame(alignment: .center)
                .padding(.vertical,10)
                .background(Color.gray.opacity(0.18))
                .frame(height: 30)
                
                
                HStack{
                    RatingStar(value:EveryDetails.voteAverage/2, maximumValue: 5)
                        .padding()
                        .foregroundColor(Color.yellow)
                    
                    Text("\(Int(EveryDetails.voteAverage/2)) / 5")
                        .font(.system(size: 17))
                    Spacer()
                }///rating star's hstack
                .frame(maxWidth:.infinity)
                
                
                HStack{
                    Text("\(EveryDetails.overview)")
                        .font(.system(.headline, design: .rounded))
                }
                .padding()
                
                
                
                
                Rectangle()
                    .fill(.gray)
                    .frame(height: 0.5)
                    .frame(maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.horizontal)
                
                VStack{
                    Text("Story: A worthy sequel to the 2009 film Avatar, James Cameron takes us back to the stunning world of Pandora, where human turned Na'vi Jake Sully (Sam Worthington) and Na'vi princess Ney'tiri (Zoe Saldaña) must do everything it takes to protect their children from the ‘sky people’ (humans from earth).")
                        .lineSpacing(2)
                        .font(.system(.body, design: .rounded))
                    
                    
                        .padding(.bottom,5)
                    Text("Review: The way of water connects all things. The sea is our home before our birth and after we die.” Beyond the 3D visual spectacle that Avatar is, something we trust James Cameron to deliver, the franchise’s beauty lies in its underlying spiritual arc and ode to continuity of life. Life finds a way. It evolves no matter the surroundings as love is transformative.")
                        .font(.caption2)
                        .padding(.bottom,5)
                    Text( " Humans call the Na’vi ‘hostiles and insurgents’, when it is they who forcefully infiltrate and occupy their land. Despite its magical, fictional setting, Avatar is not devoid of socio-political themes. It addresses race, civilisation, takes a strong anti-military stand and makes a plea for environment conservation through its simple story of parents and children. A spectacular climax revolves around parents protecting their children and vice versa.")
                        .font(.system(size: 15))
                        .padding(.bottom,5)
                    Text(" From lush jungles to the gorgeous reefs… the action shifts from forests to the sea this time around and it’s equally meditative and hypnotic. For over three hours you find yourself immersed in the enchanting world of an oceanic clan (Metkayina) or the reef people who give Sully and his family a refuge from humans. The sequel scores high on action and emotion. One is not compromised for the other. ‘Happiness is simple. The Sullys stay together. This is our biggest weakness and our greatest strength,” says Jake Sully and the story embodies that spirit. The tale isn’t unique per se but the storytelling and visual excellence are otherworldly epic. Mounted on a massive scale, not once do you find yourself wanting to return to the real world.")
                        .font(.system(size: 15))
                        .padding(.bottom,5)
                    Text(" While the predecessor set the bar high for visual effects 13 years ago, the new film takes it a step further. Like the previous film, the director does not use 3D as a gimmick but uses it artfully to accentuate audience immersion in the world and story. Avatar: The Way of Water deserves be watched in IMAX 3D. It is the greatest immersive cinema experience of the year — world building at its finest.")
                        .font(.system(size: 15))
                        .padding(.bottom,5)
                }
            }
            .padding()
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }///scroll view
        .alert("No Video Availble", isPresented: $showAlert) {
            Button("Got it ", role: .cancel) { }
        }
        .sheet(isPresented: $showYTScreen, content: {
            YoutubeVideoView(videoID:YTResult)
        })
        .onAppear {
            print(EveryDetails.backdropPath!)
            print(EveryDetails.id)
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
            guard let data = data else {
                // handle missing data
                print("data not available ")
                return
            }
            do {
                // try parsing the data
                self.json = try JSONSerialization.jsonObject(with: data, options: [])
                // use the parsed data in your SwiftUI code
            } catch {
                print("Error parsing data: \(error)")
                
            }
            
            print("\(String(describing: json))")
            print("\(data)")
            
            
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
                    
                    
                    print("YTResult")
                    print("YTResult2")
                    print("YTResult3")
                    print("YTResult4")
                    
                    print(YTResult)
                    
                    print("YTResult5")
                    print("YTResult6")
                    print("YTResult7")
                    
                }
                print("success parsing data9")
                // sucess we can use video link from ytresult[0].key
            } catch {
                
                
                // handle error
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


struct RatingStar: View {
    var value: Double
    var maximumValue: Double
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<Int(maximumValue)) { index in
                Image(systemName: index < Int(value) ? "star.fill" : "star")
                    .font(.system(size: 16))
            }
        }
    }
}


