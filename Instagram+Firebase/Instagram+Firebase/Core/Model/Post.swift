//
//  Post.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/21/24.
//

import FirebaseFirestore
import Firebase

struct Post: Codable, Identifiable {
   @DocumentID var id: String?
    let ownerUid: String
    let ownerName: String
    let caption: String
    let likes: Int
    let imageUrl: String
    let ownerImageUrl: String
    let createdAt: Timestamp
}
