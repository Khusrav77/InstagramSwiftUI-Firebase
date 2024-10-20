//
//  ProfileViewModel.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/20/24.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func follow() {
        guard let uid = user.id else { return }
        UserService.follow(uid: uid) { _ in
            self.user.isFollowed = true
        }
    }
    
    func unfollow() {
        print("DEBUG: Unfollowing user")
    }
    
    func checkIfFollowed() {
        print("DEBUG: Checking if user is followed")
    }
}
