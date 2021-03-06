//
//  AskHelpView.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 23/5/22.
//

import SwiftUI

enum EmergencyType {
    case fuel
    case accident
    case damage
    case other
}

struct AskHelpView: View {
    @StateObject private var vm = AskHelpViewModel()
    @ObservedObject private var locationManager = LocationManager()
    @EnvironmentObject private var profileVM: ProfileViewModel
    
    var body: some View {
        ZStack {
            Color.theme.background
            CustomNavBarView {
                ScrollView {
                    VStack(alignment: .center, spacing: 24.0) {
                        
                        VStack(alignment: .leading) {
                            Text("Emergency Type")
                                .font(.title3)
                                .bold()
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                                Button {
                                    // Do Something
                                    vm.emergencyType = .fuel
                                    vm.emergencyTypeText = "Refuel"
                                } label: {
                                    EmergencyChipView(image: "fuel", title: "Fuel", isSelected: vm.emergencyType == .fuel)
                                }
                                
                                Button {
                                    // Do Something
                                    vm.emergencyType = .accident
                                    vm.emergencyTypeText = "Accident"
                                } label: {
                                    EmergencyChipView(image: "accident", title: "Accident", isSelected: vm.emergencyType == .accident)
                                }
                                
                                Button {
                                    // Do Something
                                    vm.emergencyType = .damage
                                    vm.emergencyTypeText = "Malfunciton"
                                } label: {
                                    EmergencyChipView(image: "bike", title: "Damage", isSelected: vm.emergencyType == .damage)
                                }
                                
                                Button {
                                    // Do Something
                                    vm.emergencyType = .other
                                    vm.emergencyTypeText = "Other"
                                } label: {
                                    EmergencyChipView(image: "emm", title: "Other", isSelected: vm.emergencyType == .other)
                                }

                            }
                            .padding(.horizontal, 48)
                        }
                        
                        
                        VStack(alignment: .leading) {
                            Text("Add a short note")
                                .font(.title3)
                                .bold()
                            
                            TextEditor(text: $vm.emergencyTypeText)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(.white)
                                )
                                .frame(height: 96)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Add a Image(Optional)")
                                .font(.title3)
                                .bold()
                                 
                            Button {
                                // Do Something
                            } label: {
                                Image("placeholder")
                                    .resizable()
                                    .scaledToFit()
                                
                            }

                        }
                        
                        Button {
                            if let location = locationManager.location?.coordinate {
                                vm.postAlert(lat: "\(location.latitude)", long: "\(location.longitude)", name: profileVM.userProfile?.name ?? "", number: profileVM.phone)
                            }
                            
                            
                        } label: {
                            Text("ASK FOR HELP NOW")
                                .foregroundColor(.white)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                )
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "phone.fill")
                                .foregroundColor(.white)
                                .font(.title)
                                .padding()
                                .background(
                                    Circle()
                                )
                        }

                    }
                }
                
                .padding()
                
            }
        }
        .navigationBarHidden(true)
        
    }
}

struct AskHelpView_Previews: PreviewProvider {
    static var previews: some View {
        AskHelpView()
    }
}
