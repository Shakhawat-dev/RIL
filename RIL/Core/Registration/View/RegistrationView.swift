//
//  RegistrationView.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 18/4/22.
//

import SwiftUI

struct RegistrationView: View {
    @ObservedObject var vm = RegistrationViewModel()
    
    var body: some View {
        
        ZStack {
            Color.theme.background
            
            ScrollView {
                VStack {
                    VStack {
                        Text("Let's Get Started")
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
                        TitledEditTextView(title: "Name", placeHolder: "Your Name", text: $vm.name)
                        
                        TitledEditTextView(title: "Email", placeHolder: "Your Email", text: $vm.email)
                        
                        TitledEditTextView(title: "Phone Number", placeHolder: "Your Phone", text: $vm.phone)
                        
                        TitledEditTextView(title: "Address", placeHolder: "Address Ex. Banani", text: $vm.address)
                        
                        TitledEditTextView(title: "Password", placeHolder: "Password", text: $vm.password, isSecured: true)
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
                                vm.createUser()
                            } label: {
                                RoundedButtonView(title: "Register")
                            }
                            
                            HStack {
                                Text("Already Have Account?")
                                    .foregroundColor(.gray)
                                
                                NavigationLink {
                                    SignInView()
                                } label: {
                                    Text("Sign In")
                                }

                                
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

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
