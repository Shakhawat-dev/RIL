//
//  SignInViewModel.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 12/5/22.
//

import Foundation
import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    var user: User? {
      didSet {
        objectWillChange.send()
      }
    }

    func listenToAuthState() {
      Auth.auth().addStateDidChangeListener { [weak self] _, user in
        guard let self = self else {
          return
        }
        self.user = user
      }
    }

    func signUp(
      emailAddress: String,
      password: String
    ) {
      Auth.auth().createUser(withEmail: emailAddress, password: password)
    }

    func signIn(
      emailAddress: String,
      password: String
    ) {
      Auth.auth().signIn(withEmail: emailAddress, password: password)
    }

    func signOut() {
      try? Auth.auth().signOut()
    }
}
