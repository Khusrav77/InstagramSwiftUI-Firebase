//
//  ProfileHeaderView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/12/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(systemName: "person")
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
            
            Text("Profile")
                .font(.headline)
                .padding([.leading, .top] )
            
            Text("This is a profile page")
                .font(.subheadline)
                .padding(.leading)
                .padding(.top, 1)
            
            HStack{
                Spacer()
                ProfileActionButtonView()
                Spacer()
            }
            .padding(.top)
        }
    }
}

#Preview {
    ProfileHeaderView()
}
