//
//  SearchViewModel.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/17/24.
//

import SwiftUI
import FirebaseFirestore


final class SearchViewModel: ObservableObject {
    // MARK: - Properties
    @Published var users: [User] = []
    
    init() {
        fetchUsers()
    }
    
    func filterUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter({ $0 .userName.lowercased().contains(lowercasedQuery) || $0.fullName.lowercased().contains(lowercasedQuery) })
    }
    
    private func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else {
                print("DEBUG: No documents in snapshot.")
                return
            }
            self.users = documents.compactMap({try? $0.data(as: User.self)})
            print("DEBUG: users.\(self.users)")
        }
    }
}
