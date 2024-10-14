//
//  ProfileActionButtonView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/12/24.
//

import SwiftUI

struct ProfileActionButtonView: View {
    // MARK: - Properties
    var isCurrentUser: Bool = false
    var isFollowed: Bool = false
    var action: () -> Void = { }
    // MARK: - Body
    var body: some View {
        if isCurrentUser {
            Button {
               action()
            } label: {
                Text("Edit Profile")
                    .font(.headline)
                    .foregroundStyle(.black)
                    .frame(width: 360, height: 32)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1)
                        )
            }
        } else {
            HStack {
                Button {
                    action()
                } label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.headline)
                        .foregroundStyle(isFollowed ? .black : .white)
                        .frame(width: 172, height: 32)
                        .background(isFollowed ? Color.white : Color.blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0)
                            )
                }.cornerRadius(3)
                
                Button {
                    action()
                } label: {
                    Text("Message")
                        .font(.headline)
                        .foregroundStyle(.black)
                        .frame(width: 172, height: 32)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1)
                            )
                }
            }
        }
    }
}

#Preview {
    ProfileActionButtonView()
}
