//
//  HomeView.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 20/2/22.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @StateObject var vm = HomeViewModel()
    @State var selectedTab = "Home"
    @State var showMenu: Bool = false
    
    let screen = UIScreen.main.bounds
    
    
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            Map(coordinateRegion: $vm.mapRegion, showsUserLocation: true)

            //            MapView()
            
            VStack {
                
                headerSection
                
                Spacer()
                
                bottomTabViewSection
                    .overlay(alignment: .top, content: {
                        Image("g_prev_ui")
                            .resizable()
                            .frame(width: 128, height: 128)
                            .aspectRatio(contentMode: .fit)
                    })
                    .ignoresSafeArea(edges: .bottom)
            }
            
            sideMenu
            
        }
        .ignoresSafeArea(edges: .bottom)
        .onAppear {
            vm.checkIfLocationServiceIsEnabled()
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

var tabs = ["All Alerts", "Add Details"]

extension HomeView {
    var sideMenu: some View {
        HStack(spacing: 0) {
            SideMenuView()
                .offset(x: showMenu ? 0 : -screen.width)
            
            Spacer()
            
        }
        .background(
            Color.black.opacity(showMenu ? 0.2 : 0)
                .onTapGesture {
                    withAnimation() {
                        showMenu = false
                    }
                }
        )
    }
    
    var headerSection: some View {
        HStack {
            Button {
                withAnimation {
                    showMenu.toggle()
                }
                
            } label: {
                Image(systemName: "line.3.horizontal")
                    .padding()
            }
            
            Spacer()
            
            Image("logo_with_trans")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 48.0)
            
            Spacer()
            
            NavigationLink(destination: ProfileView()) {
                Image(systemName: "person")
                    .padding()
                    .background(
                        Circle()
                            .fill(Color.red)
                    )
                    .clipShape(Circle())
                    .padding(.trailing)
                    .foregroundColor(.white)
                
            }
            
            
        }
        .background(
            ArcShape(curveSize: 40)
                .fill(Color.theme.background)
                .ignoresSafeArea(edges: .top)
        )
    }
    
    var bottomTabViewSection: some View {
        VStack {
            
            Spacer()
            
            HStack {
                
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
                
                NavigationLink {
                    AskHelpView()
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
    }
}
