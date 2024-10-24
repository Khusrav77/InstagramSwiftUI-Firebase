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
        fetchNotifications()
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
    
     private func fetchNotifications() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
       let query = COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").order(by: "timeStamp", descending: true)
        
        query.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.notifications = documents.compactMap({ try? $0.data(as: Notification.self)})
        }
    }
}
 
