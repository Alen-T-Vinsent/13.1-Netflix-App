//
//  _3_1_NetflixApp.swift
//  13.1 Netflix
//
//  Created by Apple  on 07/12/22.
//

import SwiftUI

@main
struct _3_1_NetflixApp: App {
    @AppStorage("loggedIn") var loggedIn:Bool = false
    var body: some Scene {
        WindowGroup {
            if loggedIn{
                TabBarView()
                    .preferredColorScheme(.dark)
            }else{
                ContentView()
                    .preferredColorScheme(.dark)
            }
        }
        
    }
}
