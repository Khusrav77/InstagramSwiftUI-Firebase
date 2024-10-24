//
//  UserListView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/12/24.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var vm: SearchViewModel
    @Binding var searchText: String
    var users: [User] { return searchText.isEmpty ? vm.users : vm.filterUsers(searchText) }
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(users, id: \.id) { user in
                    NavigationLink(destination: LazyView(ProfileView(user: user))) {
                        UserCellView(user: user)
                            .padding(.leading)
                    }
                }
            }
        }
    }
}


