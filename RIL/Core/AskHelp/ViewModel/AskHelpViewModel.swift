//
//  AskHelpViewModel.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 23/5/22.
//

import Foundation

class AskHelpViewModel: ObservableObject {
    @Published var emergencyType: EmergencyType?
    
    @Published var shortNoteText: String = ""
}
