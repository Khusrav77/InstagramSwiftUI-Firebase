//
//  FeedCellView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/10/24.
//

import SwiftUI
import Kingfisher

struct FeedCellView: View {
    // MARK: - Properties
    @ObservedObject var vm: FeedCellViewModel
    var didLike: Bool { return vm.post.didLike ?? false}
    
    init(vm: FeedCellViewModel) {
        self.vm = vm
    }
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            // user info
            HStack {
                KFImage(URL(string: vm.post.ownerImageUrl))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                
                Text(vm.post.ownerName)
                    .font(.system(size: 14, weight: .semibold))
            }.padding([.leading, .bottom], 8)
            
            // post image
            KFImage(URL(string: vm.post.imageUrl))
                .resizable()
                .scaledToFit()
                .frame(height: 440)
                .clipped()
            
            // action buttons
            HStack(spacing: 16) {
                Button(action: {
                    didLike ? vm.unlike() : vm.like()
                }) {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(didLike ? .red : .black)
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                }
                
                NavigationLink(destination: CommentsView(post: vm.post)) {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                }
                
                Button(action: {}) {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                }
            }
            .tint(.black)
            .padding(.leading, 4)
            
            // caption
            Text(vm.likeString)
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            HStack {
                Text(vm.post.ownerName)
                    .font(.system(size: 14, weight: .semibold)) +
                Text(" \(vm.post.caption)")
                    .font(.system(size: 14))
            }
            .padding(.horizontal, 8)
           
            Text("2d")
                .font(.system(size: 14))
                .foregroundStyle(.gray)
                .padding(.leading, 8)
                .padding(.top, -2)
        }
    }
}

