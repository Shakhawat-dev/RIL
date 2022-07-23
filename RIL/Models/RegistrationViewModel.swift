//
//  RegistrationViewModel.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 30/5/22.
//

import Foundation
import Firebase
import FirebaseAuth
import UIKit

class RegistrationViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""
    @Published var address: String = ""
    @Published var password: String = ""
    
    @Published var emergency1: String = ""
    @Published var emergency2: String = ""
    @Published var emergency3: String = ""
    
    @Published var showImageSheet = false
    @Published var imagePicked = false
    @Published var photo = UIImage() {
        didSet {
            imagePicked = true
        }
    }
    @Published var imageUrl = ""
    @Published var isChooseOrTakePhoto = false
    @Published var isPhotoSelected = false
    @Published var photoOptions: PhotoOptions = .photoLibrary
    
    private var authVM = AuthViewModel()
    
    //    @Published var newAlertText: String = ""
    
    private lazy var databasePath: DatabaseReference? = {
        guard let uid = Auth.auth().currentUser?.uid else {
            return nil
        }
        let ref = Database.database()
            .reference()
            .child("users")
        return ref
    }()
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    
    //      func stopListening() {
    //        databasePath?.removeAllObservers()
    //      }
    
    func createUser() {
        
//        authVM.signUp(emailAddress: email, password: password)
        
        Auth.auth().createUser(withEmail: email, password: password) { authResults, error in
            guard let uid = authResults?.user.uid else { return }
            
            self.postUser(uid: uid)
        }
    }
    
    private func postUser(uid: String) {
        guard let databasePath = databasePath else {
            return
        }
        
        guard let key = databasePath.childByAutoId().key else {
            return
        }
        
        if name.isEmpty || phone.isEmpty || password.isEmpty {
            return
        }
        
        let profileInfo = ProfileModel(address: address, emergencyNumber: [emergency1, emergency2, emergency3], mail: email, name: name, notificationId: "", ph: phone, pp: "", userId: uid, status: 0)
        
        do {
            let data = try encoder.encode(profileInfo)
            let json = try JSONSerialization.jsonObject(with: data)
            databasePath.child(uid)
                .setValue(json)
        } catch {
            print("an error occurred", error)
        }
    }
}
