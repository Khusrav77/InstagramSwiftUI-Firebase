//
//  UserCellView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/12/24.
//

import SwiftUI
import Kingfisher

struct UserCellView: View {
    let user: User
    var body: some View {
        HStack {
            KFImage(URL(string: user.profileImageUrl ?? ""))
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
                
            VStack(alignment: .leading) {
                Text(user.userName)
                    .font(.headline)
                
                Text(user.fullName)
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}

