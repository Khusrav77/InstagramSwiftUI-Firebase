//
//  ImageUpLoader.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/17/24.
//

import UIKit
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping (Result<String, Error>) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            completion(.failure(NSError(domain: "ImageConversionError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to convert UIImage to JPEG data."])))
            return
        }
        
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Error uploading image: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            ref.downloadURL { url, error in
                if let error = error {
                    print("DEBUG: Error fetching download URL: \(error.localizedDescription)")
                    completion(.failure(error))
                    return
                }
                
                guard let imageUrl = url?.absoluteString else {
                    completion(.failure(NSError(domain: "DownloadURLError", code: -2, userInfo: [NSLocalizedDescriptionKey: "Failed to get image URL."])))
                    return
                }
                
                completion(.success(imageUrl))
            }
        }
    }
}
