//
//  Instagram_FirebaseApp.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/6/24.
//

import SwiftUI
import Firebase


@main
struct InstagramSwiftUIFirebase: App {
    
    init () {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
