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
                KFImage(URL(string: vm.user.profileImageUrl ?? ""))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                    
                Spacer()
                
                HStack(spacing: 16){
                    UserStateView(value: 2, title: "Posts")
                    UserStateView(value: 4, title: "Followers")
                    UserStateView(value: 6, title: "Following")
                }
                .padding(.trailing, 32)
            }
            
            Text(vm.user.fullName)
                .font(.headline)
                .padding([.leading, .top] )
            
            Text("This is a profile page")
                .font(.subheadline)
                .padding(.leading)
                .padding(.top, 1)
            
            HStack{
                Spacer()
                ProfileActionButtonView(vm: vm)
                Spacer()
            }
            .padding(.top)
        }
    }
}

