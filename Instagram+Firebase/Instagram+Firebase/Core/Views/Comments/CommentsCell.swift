//
//  CommentsCell.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/21/24.
//

import SwiftUI

struct CommentsCell: View {
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle")
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            Text("Batman").font(.headline) +
            Text(" Hello, World!").font(.subheadline)
            
            Spacer()
            
            Text("2m")
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .padding(.horizontal)
    }
}

#Preview {
    CommentsCell()
}
