//
//  MainTabView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/10/24.
//

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        
        NavigationStack {
            TabView {
                FeedView()
                    .tabItem {
                        Image(systemName: "house")
                    }
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                
                UploadPostView()
                    .tabItem {
                        Image(systemName: "plus.square")
                    }
                
                NotificatinsView()
                    .tabItem {
                        Image(systemName: "heart")
                    }
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                    }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .tint(.black)
        }
    }
}

#Preview {
    MainTabView()
}
