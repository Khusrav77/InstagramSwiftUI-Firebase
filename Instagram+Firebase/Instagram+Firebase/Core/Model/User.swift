//
//  User.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/17/24.
//

import FirebaseFirestore

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let userName: String
    let fullName: String
    let email: String
    let profileImageUrl: String
    var stats: UserStats?
    var isFollowed: Bool? = false
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id}
}

struct UserStats: Decodable {
    let followers: Int
    let following: Int
    let posts: Int
}
