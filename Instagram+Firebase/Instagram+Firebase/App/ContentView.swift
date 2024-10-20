//
//  ContentView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/6/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: AuthViewModel
    @State var selectedIndex: Int = 0
    var body: some View {
        Group {
            if vm.userSession == nil {
                LoginView()
            } else {
                if let user = vm.currentUser {
                    MainTabView(user: user, selectedIndex: $selectedIndex)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
