//
//  CategoryMenuView.swift
//  13.1 Netflix
//
//  Created by Apple  on 22/12/22.
//

import SwiftUI


struct CategoryMenuView: View {
    @State private var showMenu = false
    
    
    
    
    @State private var menuScale: CGFloat = 0.8
    @State private var menuOpacity: Double = 0.0/////
    
    var body: some View {
        Button(action: {
                self.showMenu.toggle()
        }) {
            Text("Categories ")
        }
        .fullScreenCover(isPresented: $showMenu) {
            
                EachMenuView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(BackgroundBlurView().ignoresSafeArea(.all))
                    
            
        }
        
        
        
        
    }
}

struct EachMenuView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing:20){
            Text("Movies")
            
            Spacer()
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 55,height: 55)
                    .foregroundColor(Color.white)
            }
        }
    }
      
}


struct BackgroundBlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}
