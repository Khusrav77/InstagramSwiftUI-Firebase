//
//  SearchBar.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/12/24.
//

import SwiftUI

struct SearchBar: View {
    // MARK: - Properties
    @Binding var text: String
    @Binding var isEditing: Bool
    
    // MARK: - Body
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(
                   HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.secondary)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                )
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        isEditing = true
                    }
                }
            
            if isEditing {
                Button(action: {
                    withAnimation {
                        isEditing = false
                        text = ""
                    }
                }) {
                    Text("Cancel")
                        .foregroundStyle(.black)
                        
                }
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
            }
        }
    }
}

#Preview {
    SearchBar(text: .constant("Search..."), isEditing: .constant(true))
}
