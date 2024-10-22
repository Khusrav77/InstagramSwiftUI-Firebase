//
//  Comment.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/21/24.
//

import Firebase
import FirebaseFirestore

struct Comment: Decodable, Identifiable {
    @DocumentID var id: String?
    let userName: String
    let posrOwnerUid: String
    let profileImageUrl: String
    let comment: String
    let createdAt: Timestamp
    let uid: String
}
