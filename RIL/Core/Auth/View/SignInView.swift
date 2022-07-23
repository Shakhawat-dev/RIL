//
//  SignInView.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 12/5/22.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var vm = AuthViewModel()
    
    var body: some View {
        ZStack {
            Image("back_red")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .frame(height: UIScreen.main.bounds.height)
//            Color.blue
            
            ScrollView() {
                VStack {
                    
                    Image("logo_with_trans")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .foregroundColor(.white)
                        .padding(.top)
                        
                    
//                    Spacer(minLength: 0)
                    
                    Text("Please Sign-in To Continue...")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 32)
                    
    //                Spacer(minLength: 0)
                    
                    VStack(spacing: 12.0) {
                        
                        
                        ZStack(alignment: .leading) {
                            if vm.email.isEmpty {
                                Text("Email")
                                    .foregroundColor(.white.opacity(0.7))
                                    .padding()
                                    .padding(.leading, 32)
                            }
                            
                            HStack {
                                Image(systemName: "envelope")
                                
                                TextField("", text: $vm.email)
                                    .textContentType(.emailAddress)
                                    .textInputAutocapitalization(.never)
                                    .keyboardType(.emailAddress)
                                
                            }
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                Rectangle()
                                    .stroke(lineWidth: 1)
                                    .fill(.white)
                            )
                        }
                        
                        ZStack(alignment: .leading) {
                            if vm.password.isEmpty {
                                Text("Password")
                                    .padding()
                                    .foregroundColor(.white.opacity(0.7))
                                    .padding(.leading, 32)
                                
                            }
                            
                            HStack {
                                Image(systemName: "lock")
                                
                                SecureField("", text: $vm.password)
                            }
                            
                            .padding()
                            .background(
                                Rectangle()
                                    .stroke(lineWidth: 1)
                                    .fill(.white)
                            )
                            .foregroundColor(.white)
                        }
                        
                        Button {
                            // Do Something
                            vm.signIn(emailAddress: vm.email, password: vm.password)
                        } label: {
                            HStack {
                                Spacer(minLength: 0)
                                
                                Text("SIGN IN")
                                    .fontWeight(.semibold)
                                    .padding()
                                    .foregroundColor(.white)
                                
                                Spacer(minLength: 0)
                                    
                            }
                            .background(
                                Color.theme.accent
                        )
                        }
                        
                        HStack {
                            Text("New User?")
                            
                            NavigationLink {
                                RegistrationView()
                                    .navigationBarTitleDisplayMode(.inline)
                            } label: {
                                Text("Register")
                                    .bold()
                            }

                            
                        }
                        .foregroundColor(.white)
                        
                        HStack {
                            Divider()
                                .frame(width: 128, height: 1)
                                .background(
                                    .white
                                )
                                
                            Text("OR")
                                .bold()
                            
                            Divider()
                                .frame(width: 128, height: 1)
                                .background(
                                    .white
                                )
                        }
                        
                        Text("Sign In using One Click")
                        
                        HStack {
                            Button {
                                // Do something
                                vm.googleLogin()
                            } label: {
                                HStack {
                                    Image("googlebtn")
                                        .resizable()
                                        .scaledToFit()
                                }
                            }
                            
                            Button {
                                // Do something
                            } label: {
                                HStack {
                                    Image("fb_btn")
                                        .resizable()
                                        .scaledToFit()
                                }
                            }

                        }
                        
    //                    Spacer(minLength: 0)

                    }
                    .padding(.horizontal, 32)
                    
//                    Spacer(minLength: 0)
                    
                    
                }
                .padding(.vertical, 32)
            }
            
        }
        .foregroundColor(.white)

    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
