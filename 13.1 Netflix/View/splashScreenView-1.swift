//
//  splashScreen.swift
//  13.1 Netflix
//
//  Created by Apple  on 07/12/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct SplashScreen: View {
    @State var animationFinished:Bool = false
    @State var removeGif:Bool = false
    @State var header:Bool = false
    var body: some View {
        OnboardHeaderView(header: $header)
        ZStack{
            OnboardView()
            ZStack{
                Color("BG")
                    .ignoresSafeArea()
                
                if !removeGif{
                    ZStack{
                        if animationFinished{
                            Image("Netflix-logo-red-black-png")
                                .resizable()
                                .aspectRatio(contentMode: .fit)

                        }else{AnimatedImage(url: getLogoURL())
                                .customLoopCount(nil)
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    .background(Color.black)
                    .animation(.none, value: animationFinished)
                }
            }
            .opacity(animationFinished ?0 : 1)
        }
        
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                //This gif will take time to complete 1.2 s
                
                DispatchQueue.main.asyncAfter(deadline: .now()+2.5){
                    
                    withAnimation(.easeOut(duration:0.8)){
                        animationFinished = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now()+1.5){
                        removeGif = true
                        header = true
                    }
                }
                
            }
            
            
        }
        
    }
    
    func getLogoURL()->URL{
        let bundle = Bundle.main.path(forResource: "logo2", ofType:"gif")
        let url = URL(fileURLWithPath: bundle ?? "")
        return url
    }
}
