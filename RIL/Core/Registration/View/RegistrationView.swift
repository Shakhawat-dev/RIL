//
//  RegistrationView.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 18/4/22.
//

import SwiftUI

struct RegistrationView: View {
    @ObservedObject var vm = RegistrationViewModel()
    @State var isPhotoSelected = false

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
                                vm.isChooseOrTakePhoto.toggle()
                            } label: {
                                if vm.imagePicked {
                                    Image(uiImage: vm.photo)
                                        .resizable()
                                        .clipShape(Circle())
                                        .scaledToFill()
                                        .frame(width: 128, height: 128)
                                        .background(
                                            Circle()
                                                .fill(.white)
                                        )
                                        .padding()
                                        
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
                        .actionSheet(isPresented: $vm.isChooseOrTakePhoto) { () -> ActionSheet in
                            ActionSheet(title: Text("Choose"), message: Text("Choose your option"), buttons: [
                                .default(Text("Choose a photo"), action: {
                                    isPhotoSelected = true
                                    vm.photoOptions = .photoLibrary
                                    vm.showImageSheet.toggle()
                                }),
                                .default(Text("Take a photo") , action: {
                                    isPhotoSelected = true
                                    vm.photoOptions = .camera
                                    vm.showImageSheet.toggle()
                                    
                                }),
                                .cancel({
                                    vm.showImageSheet = false
                                    vm.imagePicked = false
                                })])
                        }
                        .sheet(isPresented: $vm.showImageSheet, content: {
                            
                            switch vm.photoOptions {
                            case .photoLibrary:
                                ImagePicker(sourceType: .photoLibrary, selectedImage: $vm.photo)
                            case .camera:
                                ImagePicker(sourceType: .camera, selectedImage: $vm.photo)
                            }
                        })
                        
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
