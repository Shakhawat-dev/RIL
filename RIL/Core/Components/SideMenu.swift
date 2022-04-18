//
//  SideMenu.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 15/2/22.
//

import SwiftUI

struct SideMenu: View {
    
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                header
                
                VStack(spacing: 8) {
                    
                    Group {
                        Label {
                            Text("Your Alerts")
                        } icon: {
                            Image(systemName: "bell.fill")
                        }
                        .padding(8)
                        
                        Label {
                            Text("Your Alerts")
                        } icon: {
                            Image(systemName: "bell.fill")
                        }
                        .padding(8)
                        
                        Label {
                            Text("Your Alerts")
                        } icon: {
                            Image(systemName: "bell.fill")
                        }
                        .padding(8)
                        
                        Label {
                            Text("Your Alerts")
                        } icon: {
                            Image(systemName: "bell.fill")
                        }
                        .padding(8)
                        
                        Label {
                            Text("Your Alerts")
                        } icon: {
                            Image(systemName: "bell.fill")
                        }
                        .padding(8)
                        
                        Label {
                            Text("Your Alerts")
                        } icon: {
                            Image(systemName: "bell.fill")
                        }
                        .padding(8)
                    }
                    
                    Group {
                        Label {
                            Text("Your Alerts")
                        } icon: {
                            Image(systemName: "bell.fill")
                        }
                        .padding(8)
                        
                        Label {
                            Text("Your Alerts")
                        } icon: {
                            Image(systemName: "bell.fill")
                        }
                        .padding(8)
                        
                        Label {
                            Text("Your Alerts")
                        } icon: {
                            Image(systemName: "bell.fill")
                        }
                        .padding(8)
                        
                        Label {
                            Text("Your Alerts")
                        } icon: {
                            Image(systemName: "bell.fill")
                        }
                        .padding(8)
                        
                        Label {
                            Text("Your Alerts")
                        } icon: {
                            Image(systemName: "bell.fill")
                        }
                        .padding(8)
                        
                        Label {
                            Text("Your Alerts")
                        } icon: {
                            Image(systemName: "bell.fill")
                        }
                        .padding(8)
                    }
                    
                }
                .padding(8)
                
                Spacer()
                
            }
            
            .frame(width: UIScreen.main.bounds.width - 90)
            
            Spacer(minLength: 0)
        }
        
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}

extension SideMenu {
    private var header: some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .padding()
                .background(
                    Circle()
                        .stroke()
                )
                .frame(width: 68, height: 68, alignment: .center)
                
            
            VStack(alignment: .leading) {
                Text("Hello, World!")
                    .font(.headline)
                Label {
                    Text("Dhaka, Bangladesh")
                } icon: {
                    Image(systemName: "location")
                }
                .font(.subheadline)

            }
            
            Spacer(minLength: 0)
        }
        .padding()
        .padding(.vertical)
        .background(
            Color.blue
        )
        .frame(height: 128, alignment: .leading)
    }
}
