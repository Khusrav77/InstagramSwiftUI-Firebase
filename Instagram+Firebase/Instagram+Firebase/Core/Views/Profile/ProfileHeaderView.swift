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
                    VStack(alignment: .center){
                        Text("2")
                            .font(.headline)
                        
                        Text("Posr")
                            .font(.subheadline)
                    }
                    .frame(width: 80)
                    
                    VStack(alignment: .center){
                        Text("5")
                            .font(.headline)
                        
                        Text("Followers")
                            .font(.subheadline)
                    }
                    .frame(width: 80)
                    
                    VStack(alignment: .center){
                        Text("3")
                            .font(.headline)
                        
                        Text("Following")
                            .font(.subheadline)
                    }
                    .frame(width: 80)
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
                Button {
                    
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
                Spacer()
            }
            .padding(.top)
        }
    }
}

#Preview {
    ProfileHeaderView()
}
