//
//  ContentView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/6/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: AuthViewModel
    
    var body: some View {
        Group {
            if vm.userSession == nil {
                LoginView()
            } else {
                if let user = vm.currentUser {
                    MainTabView(user: user)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
