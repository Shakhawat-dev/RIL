//
//  RILApp.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 15/2/22.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct RILApp: App {
    
    init() {
        FirebaseApp.configure()
        Database.database().isPersistenceEnabled = true
        
//        GIDSignIn.sharedInstance.handle(url)
        
//        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
//        GIDSignIn.sharedInstance().delegate = self
//        print("Client ID: \(FirebaseApp.app()?.options.clientID)")
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
                    .navigationBarHidden(true)
            }
            .environmentObject(AuthViewModel())
            .environmentObject(ProfileViewModel())
            .environment(\.colorScheme, .light)
        }
    }
}
