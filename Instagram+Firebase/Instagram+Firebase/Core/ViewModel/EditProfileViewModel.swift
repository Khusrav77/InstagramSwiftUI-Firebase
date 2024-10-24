//
//  EditProfileViewModel.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/24/24.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    var user: User
    @Published var uploadComplete: Bool = false
    
    init(user: User) {
        self.user = user
    }
    
    func saveData(_ bio: String) {
        guard let uid = user.id else { return }
        COLLECTION_USERS.document(uid).updateData(["bio": bio]) { _ in
            self.user.bio = bio
            self.uploadComplete = true
        }
    }
}
