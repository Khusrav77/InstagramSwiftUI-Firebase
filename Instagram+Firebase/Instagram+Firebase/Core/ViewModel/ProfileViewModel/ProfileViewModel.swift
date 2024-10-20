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
        checkIfFollowed()
    }
    
    func follow() {
        guard let uid = user.id else { return }
        UserService.follow(uid: uid) { _ in
            self.user.isFollowed = true
        }
    }
    
    func unfollow() {
        guard let uid = user.id else { return }
        UserService.unfollow(uid: uid, completion: { _ in
            self.user.isFollowed = false
        })
    }
    
    func checkIfFollowed() {
        guard !user.isCurrentUser else { return }
        guard let uid = user.id else { return }
        UserService.isFollowed(uid: uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
}
