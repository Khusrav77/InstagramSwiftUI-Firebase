//
//  UploadPostViewModel.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/20/24.
//

import SwiftUI
import FirebaseStorage
import Firebase

final class UploadPostViewModel: ObservableObject {
    
    func uploadPost(caption: String, image: UIImage, completion: @escaping FirestorCompletion) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        ImageUploader.uploadImage(image: image, type: .post) { imageUrl in
            let data = ["caption": caption,
                        "imageUrl": imageUrl,
                        "ownerUid": user.id ?? "",
                        "likes": 0,
                        "timestamp": Timestamp(date: Date()),
                        "ownerImage": user.profileImageUrl,
                        "ownerUserName": user.userName] as [String: Any]
            
            COLLECTION_POST.addDocument(data: data, completion: completion)
        }
    }
}

