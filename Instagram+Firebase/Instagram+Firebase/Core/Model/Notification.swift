//
//  Notification.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/22/24.
//

import Firebase
import FirebaseFirestore

struct Notification: Identifiable, Decodable {
    @DocumentID var id: String?
    var postId: String?
    let userName: String
    let profileImageUrl: String
    let createdAt: Timestamp
    let type: NotificationType
    let uid: String
    var isFollowed: Bool? = false
}

enum NotificationType: Int, Codable {
    case like
    case comment
    case follow
    
    var notifivationMessage: String {
        switch self {
        case .like: return "liked one of your posts"
        case .comment: return "commented on one of your posts"
        case .follow: return "started following you"
        }
    }
}
