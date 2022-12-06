import SwiftUI

struct OnboardView:View{
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
            
        }
        .padding(.horizontal,40)
    }
}

