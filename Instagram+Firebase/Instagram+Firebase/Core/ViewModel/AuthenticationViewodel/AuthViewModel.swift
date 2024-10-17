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
    
    func logIn(with email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Login failed: \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
        }
        
    }
    
    func logOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func register(with email: String, password: String, username: String, fullName: String, image: UIImage?) {
        guard let image = image else { return }
        
        ImageUploader.uploadImage(image: image) { imageUrl in
            switch imageUrl {
            case .success(let imageUrl):
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error{
                        print("Error creating user: \(error.localizedDescription)")
                        return
                    }
                    guard let user = result?.user else { return }
                    self.userSession = user
                    print("Successfully registered user...")
                    
                    let data: [String: Any] = [
                        "email": email,
                        "username": username,
                        "fullName": fullName,
                        "profileImageUrl": imageUrl,
                        "uid": user.uid]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { error in
                        if let error = error {
                            print("Error saving user data: \(error.localizedDescription)")
                        } else {
                            print("Successfully saved user data...")
                            self.userSession = user
                        }
                    }
                }
            case .failure(let error):
                print("Error uploading image: \(error.localizedDescription)")
            }
        }
    }
    
    func resetPassword() {
        
    }
    
    func fetchUser() {
        
    }
}
