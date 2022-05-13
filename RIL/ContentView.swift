//
//  ContentView.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 15/2/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var authModel: AuthViewModel
    
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .leading, vertical: .center)){
            
            Color.white
            
            Group {
              if authModel.user == nil {
                  SignInView()
              } else {
                  HomeView()
              }
            }
            .onAppear {
                authModel.listenToAuthState()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
    }
}
