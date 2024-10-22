//
//  CommentsView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/21/24.
//

import SwiftUI

struct CommentsView: View {
    @State var comment: String = ""
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 24) {
                    ForEach(0..<10) { _ in
                        CommentsCell()
                    }
                }
            }
            .padding(.top, 24)
            
            CustomInputView(inputText: $comment) {
                //addComment()
            }
        }
        
    }
}

#Preview {
    CommentsView()
}
