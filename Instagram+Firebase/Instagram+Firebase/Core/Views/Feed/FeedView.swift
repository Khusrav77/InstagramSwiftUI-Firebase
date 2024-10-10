//
//  FeedView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/10/24.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            ForEach(0..<10) { _ in
                FeedCellView()
            }
        }
    }
}

#Preview {
    FeedView()
}
