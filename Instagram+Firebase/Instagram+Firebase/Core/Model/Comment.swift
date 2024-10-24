//
//  Comment.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/21/24.
//

import Firebase
import FirebaseFirestore

struct Comment: Decodable, Identifiable {
    @DocumentID var id: String?
    let userName: String
    let posrOwnerUid: String
    let profileImageUrl: String
    let comment: String
    let timesTamp: Timestamp
    let uid: String
    
    var timesTampString: String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: timesTamp.dateValue(), to: Date()) ?? ""
    }
}
