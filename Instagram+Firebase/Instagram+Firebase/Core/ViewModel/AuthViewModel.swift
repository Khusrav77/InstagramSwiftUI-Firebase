//
//  AuthViewModel.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/16/24.
//

import SwiftUI
import FirebaseAuth

final class AuthViewModel: ObservableObject {
    static let shared = AuthViewModel()
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func logIn(with email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Login failed: \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func register(with email: String, password: String, username: String, fullName: String, image: UIImage?) {
        guard let image = image else { return }
        
        ImageUploader.uploadImage(image: image, type: .profile) { imageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error{
                    print("DEBUG: Error creating user: \(error.localizedDescription)")
                    return
                }
                guard let user = result?.user else { return }
                print("Successfully registered user...")
                
                let data = [
                    "email": email,
                    "username": username,
                    "fullName": fullName,
                    "profileImageUrl": imageUrl,
                    "uid": user.uid]
                
                COLLECTION_USERS.document(user.uid).setData(data) { _ in
                    print("Successfully saved user data...")
                    self.userSession = user
                    self.fetchUser()
                }
            }
        }
    }
    
    func logOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func resetPassword() {
        
    }
    
    private func fetchUser() {
        guard let uid = userSession?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { (snapshot, error) in
            if let error {
                print("DEBUG: Error fetching user: \(error.localizedDescription)")
                return
            }
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
        }
    }
    
}
