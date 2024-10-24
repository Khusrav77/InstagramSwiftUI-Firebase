//
//  ProfileActionButtonView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/12/24.
//

import SwiftUI

struct ProfileActionButtonView: View {
    // MARK: - Properties
    @ObservedObject var vm: ProfileViewModel
    var isFollowed: Bool { return vm.user.isFollowed ?? false}
    @State var showEditProfile: Bool = false
    // MARK: - Body
    var body: some View {
        if vm.user.isCurrentUser {
            Button {
                showEditProfile = true
            } label: {
                Text("Edit Profile")
                    .font(.headline)
                    .foregroundStyle(.black)
                    .frame(width: 360, height: 32)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1)
                        )
            }.sheet(isPresented: $showEditProfile) {
                EditProfileView(user: $vm.user)
            }
        } else {
            HStack {
                Button {
                    isFollowed ? vm.unfollow() : vm.follow()
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

