//
//  SideMenuView.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 13/5/22.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    @EnvironmentObject private var authModel: AuthViewModel
    @EnvironmentObject private var profileVM: ProfileViewModel
    let screen = UIScreen.main.bounds
    
    @State var showLogoutAlert: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.background
            
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        HStack {
    //                        Image(systemName: "person")
    //                            .padding()
    //                            .frame(width: 64, height: 64)
    //                            .background(
    //                                Circle()
    //                                    .fill(Color.red)
    //                            )
    //
    //                            .clipShape(Circle())
                            
                            if let pp = profileVM.userProfile?.pp {
                                KFImage(URL(string: pp))
                                    .resizable()
                                    .padding()
                                    .clipShape(Circle())
                                    .background(
                                        Circle()
                                            .fill(.white)
                                    )
                                    .frame(width: 64, height: 64)
                            } else {
                                Image(systemName: "person")
                                    .resizable()
                                    .padding()
                                    
                                    .clipShape(Circle())
                                    .background(
                                        Circle()
                                            .fill(.white)
                                    )
                                    .frame(width: 64, height: 64)
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("\(profileVM.userProfile?.name ?? "")")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                
                                HStack {
                                    Image(systemName: "phone.fill")
                                    Text("\(profileVM.userProfile?.ph ?? "")")
                                        .font(.headline)
                                }
                                
                                if let address = profileVM.userProfile?.address {
                                    HStack {
                                        Image(systemName: "map.fill")
                                        Text("\(address)")
                                            .font(.headline)
                                    }
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
                    }

                    
                    
                    
//                    ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                            Group {
                                NavigationLink {
                                    AllAlertsView()
                                } label: {
                                    MenuItemView(title: "Your Alerts", icon: "bell.fill", isSystem: true)
                                }


                                NavigationLink {
                                    ProfileView()
                                } label: {
                                    MenuItemView(title: "My profile", icon: "person.fill", isSystem: true)
                                }
                                
                                NavigationLink {
                                    WebView(url: "https://raselindustry.com/service-center/")
                                } label: {
                                    MenuItemView(title: "Servicing Center", icon: "tools", isSystem: false)
                                }

                                NavigationLink {
                                    WebView(url: "https://raselindustry.com/our-bikes/")
                                } label: {
                                    MenuItemView(title: "Our Bikes", icon: "biker_clr", isSystem: false)
                                }
                                
                                NavigationLink {
                                    WebView(url: "https://raselindustry.com/spare-parts/")
                                } label: {
                                    MenuItemView(title: "Spare Parts", icon: "cogs", isSystem: false)
                                }
                                
                                NavigationLink {
                                    WebView(url: "https://raselindustry.com/distribution-network/")
                                } label: {
                                    MenuItemView(title: "Partner Outlets", icon: "handshake", isSystem: false)
                                }
                                
                                NavigationLink {
                                    WebView(url: "https://raselindustry.com/news-events/")
                                } label: {
                                    MenuItemView(title: "News and Updates", icon: "update", isSystem: false)
                                }
                                
                                NavigationLink {
                                    WebView(url: "https://raselindustry.com/tips&tricks/")
                                } label: {
                                    MenuItemView(title: "Tips & Tricks", icon: "idea", isSystem: false)
                                }
                                
                            }
                            
                            Group {
                                NavigationLink {
                                    WebView(url: "https://raselindustry.com/booking/")
                                } label: {
                                    MenuItemView(title: "Pre Bookings", icon: "carts", isSystem: false)
                                }
                                
                                NavigationLink {
                                    WebView(url: "https://raselindustry.com/user-complain/")
                                } label: {
                                    MenuItemView(title: "User & complain", icon: "compalin", isSystem: false)
                                }
                                
                                NavigationLink {
                                    WebView(url: "https://raselindustry.com/bike-loan-form/")
                                } label: {
                                    MenuItemView(title: "Bike & Loan", icon: "loan", isSystem: false)
                                }
                                
                                NavigationLink {
                                    WebView(url: "https://raselindustry.com/contact-us/")
                                } label: {
                                    MenuItemView(title: "Contact Us", icon: "help_line", isSystem: false)
                                }
                            }
                            

                            Button {
                                showLogoutAlert.toggle()
                            } label: {
                                MenuItemView(title: "Log Out", icon: "rectangle.portrait.and.arrow.right", isSystem: true)
                            }
                            
                            Divider()
                                .frame(height: 1.0)
                                
                            HStack {
                                Text("©Copyright - Rasel Industries Limited")
                                    .font(.caption2)
                            }
                            .padding()
                        }
//                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    
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
            .environmentObject(ProfileViewModel())
    }
}
