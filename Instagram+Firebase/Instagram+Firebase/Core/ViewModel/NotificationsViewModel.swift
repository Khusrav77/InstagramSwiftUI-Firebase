//
//  NotificationsViewModel.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/22/24.
//

import SwiftUI
import Firebase

 class NotificationsViewModel: ObservableObject {
    @Published var notifications: [Notification] = []
    
    init() {
        
    }
    
     static func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        var data: [String: Any] = [
            "timestamp": Timestamp(date: Date()),
            "username": user.userName,
            "uid": user.id ?? "",
            "profileImageUrl": user.profileImageUrl,
            "type": type.rawValue
            
        ]
        
        if let post = post, let id = post.id {
            data["postId"] = id
        }
        
        COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").addDocument(data: data)
        
    }
    
    func fetchNotification(_ notification: Notification) {
        
    }
}
 
