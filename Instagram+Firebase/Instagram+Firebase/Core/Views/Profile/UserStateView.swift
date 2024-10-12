//
//  UserStateView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/12/24.
//

import SwiftUI

struct UserStateView: View {
    // MARK: - Properties
    let value: Int
    let title: String
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .center){
            Text("\(value)")
                .font(.headline)
            
            Text(title)
                .font(.subheadline)
        }
        .frame(width: 80)
    }
}

#Preview {
    UserStateView(value: 2, title: "Posts")
}
