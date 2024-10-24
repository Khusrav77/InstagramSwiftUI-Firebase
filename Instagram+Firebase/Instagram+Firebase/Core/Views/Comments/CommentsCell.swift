//
//  CommentsCell.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/21/24.
//

import SwiftUI
import Kingfisher

struct CommentsCell: View {
    let comment: Comment
    
    var body: some View {
        HStack {
            KFImage(URL(string: comment.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
                    
            Text(comment.userName).font(.headline) +
            Text(" \(comment.comment)").font(.subheadline)
                    
            Spacer()
                    
            Text(" \(comment.timesTampString ?? "")")
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .padding(.horizontal)
    }
}
