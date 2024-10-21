//
//  PostsGridViewModel.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/21/24.
//

import SwiftUI
import FirebaseFirestore

enum PostGridConfig {
    case explore
    case profile(String)
}

final class PostsGridViewModel: ObservableObject {
    @Published var posts: [Post] = []
    let config: PostGridConfig
    init(config: PostGridConfig) {
        self.config = config
        fetchPosts(forconfig: config)
    }
    
    private func fetchPosts(forconfig config: PostGridConfig) {
        switch config {
        case .explore:
            fetchExplorePosts()
        case .profile(let uid):
            fetchUserPosts(uid: uid)
        }
        
        func fetchUserPosts(uid: String) {
            COLLECTION_POST.whereField("ownerUid", isEqualTo: uid)
                .getDocuments { snapshot, _ in
                    guard let documents = snapshot?.documents else { return }
                    self.posts = documents.compactMap({try? $0.data(as: Post.self)})
                }
        }
        
        func fetchExplorePosts() {
            COLLECTION_POST.getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                self.posts = documents.compactMap({try? $0.data(as: Post.self)})
            }
        }
    }
}