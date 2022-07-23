//
//  SignInViewModel.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 12/5/22.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

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
    
    func googleLogin() {
//        GIDSignIn.sharedInstance.presentingViewController = UIApplication.shared.windows.first?.rootViewController
//        GIDSignIn.sharedInstance.signIn()
        
//        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
//
//        // Create Google Sign In configuration object.
//        let config = GIDConfiguration(clientID: clientID)
//
//        // Start the sign in flow!
//        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
//
//          if let error = error {
//            // ...
//            return
//          }
//
//          guard
//            let authentication = user?.authentication,
//            let idToken = authentication.idToken
//          else {
//            return
//          }
//
//          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
//                                                         accessToken: authentication.accessToken)
//
//          // ...
//        }
        
        // 1
          if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
                authenticateUser(for: user, with: error)
            }
          } else {
            // 2
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            
            // 3
            let configuration = GIDConfiguration(clientID: clientID)
            
            // 4
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
            
            // 5
            GIDSignIn.sharedInstance.signIn(with: configuration, presenting: rootViewController) { [unowned self] user, error in
              authenticateUser(for: user, with: error)
            }
          }
    }
    
//    func facebookLogin() {
//        fbLoginManager.logIn(permissions: ["email"], from: nil) { (result, error) in
//            guard result != nil else {
//                print(error!.localizedDescription)
//                return
//            }
//            guard let accessToken = AccessToken.current else { return }
//            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
//
//            Auth.auth().signIn(with: credential) { (result, error) in
//                if error != nil {
//                    print((error?.localizedDescription)!)
//                    return
//                }
//                print("Successful.")
//                result?.user.getIDToken(completion: { res, err in
//                    print("FB Access Token: \(res ?? "Not found")")
//                })
//
//                self.isActive = true
//            }
//        }
//    }

    func signOut() {
      try? Auth.auth().signOut()
    }
    
    private func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
      // 1
      if let error = error {
        print(error.localizedDescription)
        return
      }
      
      // 2
      guard let authentication = user?.authentication, let idToken = authentication.idToken else { return }
      
      let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
      
      // 3
      Auth.auth().signIn(with: credential) { [unowned self] (_, error) in
        if let error = error {
          print(error.localizedDescription)
        } else {
//          self.state = .signedIn
        }
      }
    }
}
