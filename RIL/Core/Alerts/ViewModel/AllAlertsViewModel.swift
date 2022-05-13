//
//  AllAlertsViewModel.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 12/5/22.
//

import Foundation
import Firebase

class AllAlertsViewModel: ObservableObject {
    private let database = Firebase.Database.database()
    var ref: DatabaseReference!
    
    init() {
        self.getData()
    }
    
    func getData() {
        ref = Database.database().reference()
        
        ref.child("req_db").getData(completion:  { error, snapshot in
          guard error == nil else {
            print(error!.localizedDescription)
            return;
          }
            
//            let datas = snapshot as [String: Any]
//            print(datas)
//          let userName = snapshot.value as? String ?? "Unknown";
        });
    }
}
