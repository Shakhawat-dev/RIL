//
//  HomeView.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 20/2/22.
//

import SwiftUI

struct HomeView: View {
    @State var selectedTab = "Home"
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $selectedTab) {
                Color.red
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("All Alerts")
                
                Color.green
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("Home")
                
                Color.blue
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("Add Details")
            }
            
            // Custom TabBar
            HStack(spacing: 0) {
                ForEach(tabs, id: \.self) { tab in
                    GeometryReader { geometry in
                        Button {
                            withAnimation(.spring()) {
                                selectedTab = tab
                            }
                        } label: {
                            Image(systemName: "list.bullet.rectangle")
                                .resizable()
                                .renderingMode(.template)
                                
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(selectedTab == tab ? Color.red : Color.gray )
                                .padding(tab == "Home" ? 32 : 0)
                                .background(Color.white.opacity(tab == "Home" ? 1 : 0).clipShape(Circle())
                                )
                                
                                .offset(x: tab == "Home" ? -33 : 0, y: tab == "Home" ? -80 : 0 )
                        }
                        .onAppear {
                            
                        }
                    }
                    .frame(width: 25, height: 25)
                    

                    if tab != tabs.last {
                        Spacer(minLength: 0)
                    }
                    
                }
                
                
            }
            .padding(.horizontal, 30)
            .padding(.vertical)
            .background(
//                Color.white
                TabBarCustomShape()
                    .fill(Color.white)
                    .cornerRadius(12)
            )
            
            .padding(.horizontal)
            // Bottom Edge
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            
            
            
        }
        .ignoresSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

var tabs = ["All Alerts", "Home", "Add Details"]
