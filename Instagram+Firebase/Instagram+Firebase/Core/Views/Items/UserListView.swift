//
//  UserListView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/12/24.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(0..<10) { _ in
                    NavigationLink(destination: ProfileView()) {
                        UserCellView()
                            .padding(.leading)
                    }
                }
            }
        }
    }
}

#Preview {
    UserListView()
}
