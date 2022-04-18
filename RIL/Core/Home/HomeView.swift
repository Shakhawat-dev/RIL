//
//  HomeView.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 20/2/22.
//

import SwiftUI

struct HomeView: View {
    @State var selectedTab = "Home"
    
    let screen = UIScreen.main.bounds
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            Color.green
            
            VStack {
                
                HStack {
                    Image(systemName: "line.3.horizontal")
                        .padding()
                    
                    Spacer()
                    
                    Image("logo_with_trans")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 48.0)
                    
                    Spacer()
                    
                    Image(systemName: "person")
                        .padding()
                        .background(
                            Circle()
                                .fill(Color.red)
                        )
                        .clipShape(Circle())
                }
                .padding(.horizontal)
                .background(
                    ArcShape(curveSize: 40)
                        .fill(Color.theme.background)
                        .ignoresSafeArea(edges: .top)
                )
                
                Spacer()
                
                VStack {
                    
                    Spacer()
                    
                    HStack {
                        Button {
                            // Do Something
                        } label: {
                            
                        }
                        
                        NavigationLink {
                            AllAlertsView()
                        } label: {
                            VStack {
                                Image(systemName: "bell.fill")
                                    .font(.title)
                                    .foregroundColor(.red)
                                
                                Text("View All Alerts")
                                    .font(.subheadline)
                                    .foregroundColor(.red)
                            }
                        }

                        
                        Spacer()
                        
                        Button {
                            // Do Something
                        } label: {
                            VStack {
                                Image(systemName: "camera.fill")
                                    .font(.title)
                                
                                Text("Add Details")
                                    .font(.subheadline)
                            }
                        }

                    }
                    .padding()
                    .background(
                        ArcShape(curveSize: 64)
                            .fill(Color.theme.background)
                            .rotationEffect(Angle(degrees: 180))
                    )
                }
                .frame(height: 170)
                .overlay(alignment: .top, content: {
                    Image("g_prev_ui")
                        .resizable()
                        .frame(width: 128, height: 128)
                        .aspectRatio(contentMode: .fit)
                })
                .ignoresSafeArea(edges: .bottom)
            }
        }
        .ignoresSafeArea(edges: .bottom)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

var tabs = ["All Alerts", "Add Details"]
