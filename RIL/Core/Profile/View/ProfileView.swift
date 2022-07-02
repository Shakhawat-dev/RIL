//
//  ProfileView.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 19/4/22.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @StateObject var vm: ProfileViewModel = ProfileViewModel()
    

    var body: some View {
        CustomNavBarView {
            ZStack {
                Color.theme.background
                
                ScrollView {
                    VStack {
                        VStack {
                            Text("Hey \(vm.userProfile?.name ?? "" )")
                                .font(.title2)
                                .fontWeight(.medium)
                            
                            VStack {
                                Button {
                                    // Do Something
                                } label: {
                                    if let pp = vm.userProfile?.pp {
                                        KFImage(URL(string: pp))
                                            .resizable()
                                            .frame(width: 64, height: 64)
                                            .padding()
                                            .clipShape(Circle())
                                            .background(
                                                Circle()
                                                    .fill(.white)
                                            )
                                    } else {
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
                                    
                                }

                                
                                    
                                Text("Click to change")
                                    .font(.caption)
                                    .fontWeight(.thin)
                                
                            }
                            
                        }
                        .padding()
                        
                        Group {
                            TitledEditTextView(title: "Email", placeHolder: "Your Email", text: $vm.email)
                            
                            TitledEditTextView(title: "Phone Number", placeHolder: "Your Phone", text: $vm.phone)
                            
                            TitledEditTextView(title: "Address", placeHolder: "Address Ex. Banani", text: $vm.address)
                        }
                        
                        Group {
                            VStack(alignment: .leading) {
                                Text("Add Emergency Contacts")
                                    .font(.title3)
                                    .fontWeight(.medium)
                                    .padding(.vertical)
                                
                                TitledEditTextView(title: "Emergency 1", placeHolder: "Emergency phone 1", text: $vm.emergency1)
                                
                                TitledEditTextView(title: "Emergency 2", placeHolder: "Emergency phone 1", text: $vm.emergency2)
                                
                                TitledEditTextView(title: "Emergency 3", placeHolder: "Emergency phone 1", text: $vm.emergency3)
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
            .navigationBarHidden(true)
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
