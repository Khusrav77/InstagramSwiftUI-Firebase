//
//  UserCellView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/12/24.
//

import SwiftUI

struct UserCellView: View {
    var body: some View {
        HStack {
            Image(systemName: "photo")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
                
            VStack(alignment: .leading) {
                Text("Khusrav Safiev")
                    .font(.headline)
                
                Text("@khusrav_safiev")
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}

#Preview {
    UserCellView()
}
