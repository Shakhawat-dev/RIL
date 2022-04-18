//
//  ContentView.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 15/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .leading, vertical: .center)){
            
            Color.white
            
            SideMenu()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
