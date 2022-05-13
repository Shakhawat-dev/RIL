//
//  SideMenuView.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 13/5/22.
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject private var authModel: AuthViewModel
    let screen = UIScreen.main.bounds
    
    @State var showLogoutAlert: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.background
            
            ScrollView(.vertical) {
                VStack {
                    HStack {
                        Image(systemName: "person")
                            .padding()
                            .frame(width: 64, height: 64)
                            .background(
                                Circle()
                                    .fill(Color.red)
                            )
                        
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("User Name")
                                .font(.headline)
                                .fontWeight(.bold)
                            
                            HStack {
                                Image(systemName: "phone.fill")
                                Text("01856508888")
                                    .font(.headline)
                            }
                            
                            HStack {
                                Image(systemName: "map.fill")
                                Text("Dhaka")
                                    .font(.headline)
                            }
                        }
                        
                        Spacer(minLength: 0)
                    }
                    .foregroundColor(.white)
                    .padding(32)
                    .padding(.vertical, 20)
                    .background(
                        Image("cropped")
                            .resizable()
                    )
                    
                    VStack {
                        MenuItemView(title: "Your Alerts", icon: "bell.fill", isSystem: true)
                        MenuItemView(title: "My profile", icon: "person.fill", isSystem: true)
                        MenuItemView(title: "Your Alerts", icon: "bell.fill", isSystem: true)
                        MenuItemView(title: "Contact Us", icon: "bell.fill", isSystem: true)
                        
                        Button {
                            showLogoutAlert.toggle()
                        } label: {
                            MenuItemView(title: "Log Out", icon: "rectangle.portrait.and.arrow.right", isSystem: true)
                        }
                        
                        
                    }
                }
                .alert(isPresented: $showLogoutAlert) {
                    Alert(title: Text("Logout"), message: Text("Are You Sure Want to Logout"), primaryButton: .destructive(Text("Yes"), action: {
                        authModel.signOut()
                    }), secondaryButton: .cancel())
                }
                
            }
            
        }
        .frame(width: screen.width * 0.75)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
            .environmentObject(AuthViewModel())
    }
}
