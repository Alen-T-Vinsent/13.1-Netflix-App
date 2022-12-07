import SwiftUI

struct OnboardView: View{
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .red
        UIPageControl.appearance().pageIndicatorTintColor = .gray
    }
    
    private let screenWidth = UIScreen.main.bounds.size.width
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                    TabView{
                        OnboardViewModel(systemImageName: "FirstPage_firstOnboard",
                                    title: "Watch on any device",
                                    description: "Stream on your phone,tablet,laptop,and TV without playing more.")
                        
                        OnboardViewModel(systemImageName: "FirstPage_secondOnboard",
                                    title: "Download and go",
                                    description: "Save your data,watch offline on a plane,train, or submarine...")
                        
                        OnboardViewModel(systemImageName: "FirstPage_thirdOnboard",
                                    title: "No pesky contracts",
                                    description: "Join today,cancel anytime.")
                        
                    }
                    .tabViewStyle(.page(indexDisplayMode: .always))
                }

                VStack{
                    Button {
                        print("sign in pressed")
                    } label: {
                        Text("SIGN IN")
                            .padding()
                            .font(.callout)
                    }
                    .cornerRadius(3)
                    .frame(maxWidth: screenWidth/1.5)
                    .frame(height: 40)
                    .background(Color("Red"))
                    .foregroundColor(Color.white)
                    
                }
                .padding()
            }
        }
        
    }
    
}
