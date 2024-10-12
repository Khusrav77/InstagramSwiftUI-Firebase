//
//  PostGridView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/12/24.
//

import SwiftUI

struct PostGridView: View {
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    
    var body: some View {
        
        LazyVGrid(columns: items, spacing: 2) {
            ForEach(0..<10) { _ in
                NavigationLink(destination: FeedView()) {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: width)
                        .clipped()
                    
                }
            }
        }
    }
}

#Preview {
    PostGridView()
}
