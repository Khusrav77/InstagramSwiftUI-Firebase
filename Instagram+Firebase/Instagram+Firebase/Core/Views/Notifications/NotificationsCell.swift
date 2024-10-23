//
//  NotificationsCell.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/12/24.
//

import SwiftUI
import Kingfisher

struct NotificationsCell: View {
    // MARK: - Properties
    @ObservedObject var vm: NotifivcationsCellViewModel
    var isFollowed: Bool { return vm.notification.isFollowed ?? false}
    
    init(ncvm: NotifivcationsCellViewModel) {
        self.vm = ncvm
    }
    
    // MARK: - Body
    var body: some View {
        HStack {
            KFImage(URL(string: vm.notification.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 40, height:  40)
                .clipShape(Circle())
            
            Text(vm.notification.userName)
                .font(.headline) +
            
            Text(" \(vm.notification.type.notifivationMessage)")
                .font(.subheadline)
            Spacer()
            
            if vm.notification.type != .follow {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height:  40)
                
            } else {
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
                                .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0))
                }
                
            }
            
        }
        .padding(.horizontal)
    }
}

