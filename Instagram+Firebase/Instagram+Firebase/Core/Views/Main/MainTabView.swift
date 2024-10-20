//
//  MainTabView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/10/24.
//

import SwiftUI

struct MainTabView: View {
    // MARK: - Properties
    let user: User
    @Binding var selectedIndex: Int
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedIndex) {
                FeedView()
                    .onTapGesture {
                        selectedIndex = 0
                    }
                    .tabItem {
                        Image(systemName: "house")
                    }.tag(0)
                
                SearchView()
                    .onTapGesture {
                        selectedIndex = 1
                    }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }.tag(1)
                
                UploadPostView(tabIndex: $selectedIndex)
                    .onTapGesture {
                        selectedIndex = 2
                    }
                    .tabItem {
                        Image(systemName: "plus.square")
                    }.tag(2)
                
                NotificatinsView()
                    .onTapGesture {
                        selectedIndex = 3
                    }
                    .tabItem {
                        Image(systemName: "heart")
                    }.tag(3)
                
                ProfileView(user: user)
                    .onTapGesture {
                        selectedIndex = 4
                    }
                    .tabItem {
                        Image(systemName: "person")
                    }.tag(4)
            }
            .navigationTitle(tabTitle)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: logOut)
            .tint(.black)
        }
    }
    
    var logOut: some View {
        Button {
            AuthViewModel.shared.logOut()
        } label: {
            Text("Log Out")
        }
    }
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Feed"
        case 1: return "Explor"
        case 2: return "New Post"
        case 3: return "Notifications"
        case 4: return "Profile"
            default : return ""
        }
    }
}

