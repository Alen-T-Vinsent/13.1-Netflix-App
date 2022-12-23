//
//  Test.swift
//  13.1 Netflix
//
//  Created by Apple  on 23/12/22.
//

import SwiftUI

struct Test: View {
    let items:[Int] = [1,2,3,4,5,6,7,8,9,10]
    var body: some View {

        ScrollView{
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                ForEach(items, id: \.self) { item in
    
                   
                    
                    HStack(alignment:.bottom){
                        Spacer()
                        Text("Item: \(item)")
                            .frame(maxWidth:200)
                            .frame(height: 200)
                           
                        
                            
                    }
                    .background(

                    Image(systemName: "person")
                        
                        .resizable()
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                        .foregroundColor(Color.red)
                    )
                }
            }
        }
     
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
//import SwiftUI
//
//struct Test: View {
//    let items = [1, 2, 3, 4, 5]
//
//    var body: some View {
//        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
//            ForEach(items, id: \.self) { item in
//                Text("Item: \(item)")
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .background(Color.red)
//            }
//        }
//    }
//}
