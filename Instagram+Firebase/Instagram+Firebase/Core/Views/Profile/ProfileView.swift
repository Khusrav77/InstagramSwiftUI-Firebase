//
//  ProfileView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/10/24.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - Properties
    let user: User
    @ObservedObject var vm: ProfileViewModel
    
    init(user: User) {
        self.user = user
        self.vm = ProfileViewModel(user: user)
    }
    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView(vm: vm)
                
                PostGridView(config: .profile(user.id ?? ""))
            }
            .padding(.top)
        }
    }
}

