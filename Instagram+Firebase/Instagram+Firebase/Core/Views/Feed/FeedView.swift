//
//  FeedView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/10/24.
//

import SwiftUI

struct FeedView: View {
    // MARK: - Properties
    @ObservedObject var vm = PostsViewModel()
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32) {
                ForEach(vm.posts) { post in
                    FeedCellView(post: post)
                }
            }
            .padding(.top)
        }
    }
}

#Preview {
    FeedView()
}
