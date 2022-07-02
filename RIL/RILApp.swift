//
//  RILApp.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 15/2/22.
//

import SwiftUI
import Firebase

@main
struct RILApp: App {
    
    init() {
        FirebaseApp.configure()
        Database.database().isPersistenceEnabled = true
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
