//
//  AskHelpViewModel.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 23/5/22.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseDatabase

class AskHelpViewModel: ObservableObject {
    @Published var emergencyType: EmergencyType?
    
    @Published var shortNoteText: String = ""
    
//    @Published var newAlertText: String = ""
    
      private lazy var databasePath: DatabaseReference? = {
        guard let uid = Auth.auth().currentUser?.uid else {
          return nil
        }
        let ref = Database.database()
          .reference()
          .child("req_db")
        return ref
      }()
    
      private let encoder = JSONEncoder()
      private let decoder = JSONDecoder()


      func stopListening() {
        databasePath?.removeAllObservers()
      }

      func postAlert() {
        guard let databasePath = databasePath else {
          return
        }
          
          guard let key = databasePath.childByAutoId().key else {
              return
          }

        if shortNoteText.isEmpty {
          return
        }

          let alert = AlertModel(id: key, lat: "", lon: "", name: "", number: "", sosCat: shortNoteText, sosImage: "", sosMsg: "", time: "  ", uid: "", userImage: "")

        do {
          let data = try encoder.encode(alert)
          let json = try JSONSerialization.jsonObject(with: data)
          databasePath.child(key)
            .setValue(json)
        } catch {
          print("an error occurred", error)
        }
      }
}
