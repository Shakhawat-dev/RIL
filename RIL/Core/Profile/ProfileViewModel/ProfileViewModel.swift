//
//  ProfileViewModel.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 29/5/22.
//

import Foundation
import Firebase

class ProfileViewModel: ObservableObject {
//    @Published var profileList: [ProfileModel] = []
    @Published var userProfile: ProfileModel?
    
    private let database = Firebase.Database.database()
    var ref: DatabaseReference!
    
    private lazy var databasePath: DatabaseReference? = {
      guard let uid = Auth.auth().currentUser?.uid else {
        return nil
      }
      let ref = Database.database()
        .reference()
        .child("users/\(uid)")
      return ref
    }()
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    init() {
        self.getData()
    }
    
    func getData() {
        /*
        ref = Database.database().reference()
        
        ref.child("req_db").getData(completion:  { error, snapshot in
          guard error == nil else {
            print(error!.localizedDescription)
            return;
          }
            
            let datas = snapshot as [String: Any]
            print(datas)
          let userName = snapshot.value as? String ?? "Unknown";
        });
         */
        
        guard let databasePath = databasePath else {
          return
        }
        
        databasePath
            .observe(.value) { [weak self] snapshot in
            guard
              let self = self,
              let json = snapshot.value as? [String: Any]
            else {
              return
            }

//                self.profileList.removeAll()
                
//                json.forEach { value in
//                    print(value.value)
                    do {
                        let userData = try JSONSerialization.data(withJSONObject: json, options: .fragmentsAllowed)
                        print(userData)
                        
                        self.userProfile = try self.decoder.decode(ProfileModel.self, from: userData)
//                        self.profileList.append(profiles)
//                        print(self.profileList)
                    } catch {
                        print("an error occurred", error)
                      }
//                }
                
                print(self.userProfile)
          }
    }
}
