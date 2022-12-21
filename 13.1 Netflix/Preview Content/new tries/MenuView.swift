//
//  MenuView.swift
//  13.1 Netflix
//
//  Created by Apple  on 15/12/22.
//

import SwiftUI

struct MenuView: View {
    @AppStorage("loggedIn") var loggedIn:Bool = true
    @State var showAlert:Bool = false
    var body: some View {
        NavigationView {
            Text("Hello i am menu")
                .navigationTitle("Menu")
                .toolbar {
                    Button("logout"){
                        print("logout preseed")
                        loggedIn = false
                    }
                    .accentColor(Color.white)
                }
        }
    }
        
}
