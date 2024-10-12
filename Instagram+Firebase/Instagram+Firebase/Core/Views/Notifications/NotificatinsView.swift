//
//  NotificatinsView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/10/24.
//

import SwiftUI

struct NotificatinsView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(0..<10) { _ in
                    NotificationsCell()
                        .padding(.top)
                }
            }
        }
    }
}

#Preview {
    NotificatinsView()
}
