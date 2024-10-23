//
//  NotificatinsView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/10/24.
//

import SwiftUI

struct NotificatinsView: View {
    // MARK: - Properties
    @ObservedObject var vm = NotificationsViewModel()
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(vm.notifications) { notification in
                    NotificationsCell(vm: NotifivcationsCellViewModel(notification: notification))
                        .padding(.top)
                }
            }
        }
    }
}

#Preview {
    NotificatinsView()
}
