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
    
    func checkIfFollowed() {
        guard notification.type == .follow else { return }
        UserService.isFollowed(uid: notification.uid) { isFollowed in
            self.notification.isFollowed = isFollowed
        }
    }
    
}
