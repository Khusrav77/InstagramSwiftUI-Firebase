//
//  NotifivcationsCellViewModel.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/23/24.
//

import SwiftUI

class NotifivcationsCellViewModel: ObservableObject {
    @Published var notification: Notification
    
    init(notification: Notification) {
        self.notification = notification
        checkIfFollowed()
        fetchNotificationPost()
        fetchNotificationUser()
    }
    
    
    func follow() {
        UserService.follow(uid: notification.uid) { _ in
            NotificationsViewModel.uploadNotification(toUid: self.notification.uid, type: .follow)
            self.notification.isFollowed = true
        }
    }
    
    func unfollow() {
        UserService.unfollow(uid: notification.uid, completion: { _ in
            self.notification.isFollowed = false
        })
    }
    
    private func checkIfFollowed() {
        guard notification.type == .follow else { return }
        UserService.isFollowed(uid: notification.uid) { isFollowed in
            self.notification.isFollowed = isFollowed
        }
    }
    
    private func fetchNotificationPost() {
        guard let postId = notification.postId else { return }
        COLLECTION_POSTS.document(postId).getDocument { snapshot, _ in
            self.notification.post = try? snapshot?.data(as: Post.self)
        }
        
    }
    
    private func fetchNotificationUser() {
        COLLECTION_USERS.document(notification.uid).getDocument { snapshot, _ in
            self.notification.user = try? snapshot?.data(as: User.self)
        }
    }
    
}
