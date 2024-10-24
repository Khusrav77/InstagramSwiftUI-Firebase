//
//  PostGridView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/12/24.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    // MARK: - Properties
    @ObservedObject var vm: PostsGridViewModel
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    let config: PostGridConfig
    
    init(config: PostGridConfig) {
        self.config = config
        self.vm = PostsGridViewModel(config: config)
    }
    
    // MARK: - Body
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            ForEach(vm.posts) { post in
                NavigationLink(destination: FeedCellView(vm: FeedCellViewModel(post: post))) {
                    KFImage(URL(string: post.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: width)
                        .clipped()
                    
                }
            }
        }
    }
}

