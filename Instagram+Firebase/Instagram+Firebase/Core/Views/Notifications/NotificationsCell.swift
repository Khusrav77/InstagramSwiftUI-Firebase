//
//  NotificationsCell.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/12/24.
//

import SwiftUI

struct NotificationsCell: View {
    // MARK: - Properties
    private var showPostImage: Bool = false
    
    // MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height:  40)
                .clipShape(Circle())
            
            Text("button")
                .font(.headline) +
            
            Text(" liked one of your post!")
                .font(.subheadline)
            Spacer()
            
            if showPostImage {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height:  40)
                    
            } else {
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .clipShape(Capsule())
                }

            }
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationsCell()
}
