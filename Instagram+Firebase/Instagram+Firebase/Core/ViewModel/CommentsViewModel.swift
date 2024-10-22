//
//  CommentsViewModel.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/21/24.
//

import SwiftUI
import FirebaseFirestore

final class CommentsViewModel: ObservableObject {
    private let post: Post
    @Published var comments: [Comment] = []
    
    
    init(post: Post) {
        self.post = post
        fetchComments()
    }
    
    func fetchComments() {
        guard let postId = post.id else { return }
        let query = COLLECTION_POSTS.document(postId).collection("post-comments")
            .order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { snapshot, _ in
            guard let addedDocs = snapshot?.documentChanges.filter({ $0.type == .added}) else { return }
            self.comments.append(contentsOf: addedDocs.compactMap({ try? $0.document.data(as: Comment.self)}))
    }
    
    func uploadComment(for comment: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let postId = post.id else { return }
        let data: [String : Any] = [
            "username": user.userName,
            "profileImageUrl": user.profileImageUrl,
            "uid": user.id ?? "",
            "timestamp": Timestamp(date: Date()),
            "postOwnerId": post.ownerUid,
            "comment": comment
        ]
        
        COLLECTION_POSTS.document(postId).collection("post-comments").addDocument(data: data) {error in
            if let error {
                print("DEBUG: Error uploading comment: \(error.localizedDescription)")
                return
            }
        }
    }
}
