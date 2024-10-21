//
//  PostsViewModel.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/21/24.
//

import SwiftUI

class PostsViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        COLLECTION_POST.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({try? $0.data(as: Post.self)})
        }
    }
}
