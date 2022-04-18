//
//  ProfileView.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 19/4/22.
//

import SwiftUI

struct ProfileView: View {
    @State var email: String = ""
    @State var phone: String = ""
    @State var address: String = ""
    @State var password: String = ""
    
    @State var emergency1: String = ""
    @State var emergency2: String = ""
    @State var emergency3: String = ""
    
    var body: some View {
        ZStack {
            Color.theme.background
            
            ScrollView {
                VStack {
                    VStack {
                        Text("Hey Shakhawat Hossain Shahin")
                            .font(.title2)
                            .fontWeight(.medium)
                        
                        VStack {
                            Button {
                                // Do Something
                            } label: {
                                Image(systemName: "person")
                                    .resizable()
                                    .frame(width: 64, height: 64)
                                    .padding()
                                    .clipShape(Circle())
                                    .background(
                                        Circle()
                                            .fill(.white)
                                    )
                            }

                            
                                
                            Text("Click to change")
                                .font(.caption)
                                .fontWeight(.thin)
                            
                        }
                        
                    }
                    .padding()
                    
                    Group {
                        TitledEditTextView(title: "Email", placeHolder: "Your Email", text: $email)
                        
                        TitledEditTextView(title: "Phone Number", placeHolder: "Your Phone", text: $phone)
                        
                        TitledEditTextView(title: "Address", placeHolder: "Address Ex. Banani", text: $address)
                    }
                    
                    Group {
                        VStack(alignment: .leading) {
                            Text("Add Emergency Contacts")
                                .font(.title3)
                                .fontWeight(.medium)
                                .padding(.vertical)
                            
                            TitledEditTextView(title: "Emergency 1", placeHolder: "Emergency phone 1", text: $emergency1)
                            
                            TitledEditTextView(title: "Emergency 2", placeHolder: "Emergency phone 1", text: $emergency2)
                            
                            TitledEditTextView(title: "Emergency 3", placeHolder: "Emergency phone 1", text: $emergency3)
                        }
                    }
                    
                    Group {
                        VStack(spacing: 16.0) {
                            Button {
                                // Do something
                            } label: {
                                RoundedButtonView(title: "Update")
                            }
                        }
                        .padding(.top, 32)
                        
                    }
                }
                .padding()
            }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
