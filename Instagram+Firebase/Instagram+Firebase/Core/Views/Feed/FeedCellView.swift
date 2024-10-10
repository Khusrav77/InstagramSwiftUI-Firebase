//
//  FeedCellView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/10/24.
//

import SwiftUI

struct FeedCellView: View {
    // MARK: - Properties
    
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            // user info
            HStack {
                Image(systemName: "house")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                
                Text("Joker")
                    .font(.system(size: 14, weight: .semibold))
            }
            
            // post image
            Image(systemName: "house")
                .resizable()
                .scaledToFit()
                .frame(height: 440)
                .clipped()
            
            // action buttons
            HStack {
                Button(action: {}) {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                        .font(.system(size: 20))
                        .padding(4)
                }
                
                Button(action: {}) {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                        .font(.system(size: 20))
                        .padding(4)
                }
                
                Button(action: {}) {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                        .font(.system(size: 20))
                        .padding(4)
                }
            }.tint(.black)
            
            // caption
            HStack {
                Text("betman")
                    .font(.system(size: 14, weight: .semibold)) +
                Text(" All man have limitations, but I have none")
                    .font(.system(size: 14))
                    
            }
           
            Text("2d")
                .font(.system(size: 14))
                .foregroundStyle(.gray)
                .padding(.top)
        }
    }
}

#Preview {
    FeedCellView()
}
