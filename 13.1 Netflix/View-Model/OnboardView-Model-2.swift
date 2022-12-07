import SwiftUI

struct OnboardViewModel:View{
    let systemImageName:String
    let title:String
    let description:String
    
    var body: some View{
        VStack(spacing:25){
            Image(systemImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 300,height: 300)
                .foregroundColor(Color.teal)
            Text(title)
                .font(.title).bold()
            Text(description)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.secondary)
                .padding(.bottom,100)
            
        }
        .padding(.horizontal,40)
    }
}

