//
//  FeedCellViewModel.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/21/24.
//

import SwiftUI
import FirebaseFirestore

final class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    var likeString: String {
        let lable = post.likes == 1 ? "like" : "likes"
        return "\(post.likes) \(lable)"
    }
    
    var timeString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: post.timestamp.dateValue(), to: Date()) ?? ""
    }
    
    init(post: Post) {
        self.post = post
        checkIfLiked()
    }
    
    func like() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_POSTS.document(postId).collection("post-likes").document(uid).setData([:]) {_ in
            COLLECTION_USERS.document(uid).collection("user-likes").document(postId).setData([:]) {_ in
                COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes + 1])
                self.post.didLike = true
                self.post.likes += 1
            }
        }
    }
    
    func unlike() {
        guard post.likes > 0 else { return }
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
       
        COLLECTION_POSTS.document(postId).collection("post-likes").document(uid).delete {_ in
            COLLECTION_USERS.document(uid).collection("user-likes").document(postId).delete {_ in
                COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes - 1])
                
                NotificationsViewModel.uploadNotification(toUid: self.post.ownerUid, type: .like, post: self.post)
                
                self.post.didLike = false
                self.post.likes -= 1
            }
        }
    }
    
    private func checkIfLiked() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_USERS.document(uid).collection("user-likes").document(postId).getDocument { snapshot, _ in
            guard let didLike = snapshot?.exists else { return }
            self.post.didLike = didLike
        }
    }
}
