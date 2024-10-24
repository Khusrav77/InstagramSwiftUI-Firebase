//
//  ProfileHeaderView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/12/24.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @ObservedObject var vm: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                KFImage(URL(string: vm.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                    
                Spacer()
                
                HStack(spacing: 16){
                    UserStateView(value: vm.user.stats?.posts ?? 0, title: "Posts")
                    UserStateView(value: vm.user.stats?.followers ?? 0, title: "Followers")
                    UserStateView(value: vm.user.stats?.following ?? 0, title: "Following")
                }
                .padding(.trailing, 32)
            }
            
            Text(vm.user.fullName)
                .font(.headline)
                .padding([.leading, .top] )
            
            if let bio = vm.user.bio {
                Text(bio)
                    .font(.subheadline)
                    .padding(.leading)
                    .padding(.top, 1)
            }
            
            HStack{
                Spacer()
                ProfileActionButtonView(vm: vm)
                Spacer()
            }
            .padding(.top)
        }
    }
}

