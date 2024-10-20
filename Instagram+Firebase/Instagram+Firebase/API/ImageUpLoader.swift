//
//  ImageUpLoader.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/17/24.
//

import UIKit
import FirebaseStorage

enum UploadType {
    case profile
    case post
    
    var storagePath: StorageReference {
        let filename = NSUUID().uuidString
        switch self {
        case .profile:
            return Storage.storage().reference(withPath: "/profile_images/\(filename)")
        case .post:
            return Storage.storage().reference(withPath: "/posts_images/\(filename)")
        }
    }
}

struct ImageUploader {
    static func uploadImage(image: UIImage, type: UploadType, completion: @escaping (String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            print("DEBUG: Unable to convert image to jpeg data")
            return
        }
        let ref = type.storagePath
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Error uploading image: \(error.localizedDescription)")
                return
            }
            print("Successfully uploaded image")
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else {
                    print("DEBUG: Download URL is nil")
                    return
                }
                completion(imageUrl)
            }
        }
    }
}
