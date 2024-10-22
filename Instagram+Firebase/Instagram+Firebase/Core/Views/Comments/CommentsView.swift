//
//  CommentsView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/21/24.
//

import SwiftUI

struct CommentsView: View {
    // MARK: - Properties
    @State var comment: String = ""
    @ObservedObject var vm: CommentsViewModel
    
    init(post: Post) {
        self.vm = CommentsViewModel(post: post)
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 24) {
                    ForEach(vm.comments) { comment  in
                        CommentsCell(comment: comment)
                    }
                }
            }
            .padding(.top, 24)
            
            CustomInputView(inputText: $comment) {
                vm.uploadComment(for: comment)
                comment = ""
            }
        }
        
    }
}

