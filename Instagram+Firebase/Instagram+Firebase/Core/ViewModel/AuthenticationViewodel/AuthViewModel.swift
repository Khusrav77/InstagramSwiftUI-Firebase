//
//  AuthViewModel.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/16/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

class AuthViewModel: ObservableObject {
    static let shared = AuthViewModel()
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func logIn() {
        print("login")
    }
    
    func logOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func register(with email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            print("Successfully registered user...")
        }
    }
    
    func resetPassword() {
        
    }
    
    func fetchUser() {
        
    }
}
