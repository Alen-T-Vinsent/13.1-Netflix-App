import SwiftUI

struct OnboardHeaderView: View {
    @Binding var header:Bool
    var body: some View {
        HStack(spacing:20){
            HStack{
                Image("Netflix-logo-red-black-png-removebg-preview")
                    .resizable()
                    .frame(width: 150,height: 75)
            }
            
            Spacer()
            
            HStack(alignment: .center){
                Button {
                    
                } label: {
                    Text("Privacy")
                        .font(.callout)
                        .fontWeight(.bold)
                }
                
                Button {
                    
                } label: {
                    Text("Help")
                        .font(.callout)
                        .fontWeight(.bold)
                }


            }
            .padding()
            .foregroundColor(Color.white)
            
        }
        .padding()
        .padding(.top,20)
        .ignoresSafeArea()
        .opacity(header ? 1 : 0)
    }
}

