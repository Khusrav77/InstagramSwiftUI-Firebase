//
//  TextArea.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/20/24.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    
    init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeholder = placeholder
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundStyle(Color(uiColor: .placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.top, 12)
            }
            TextEditor(text: $text)
                .padding(4)
        }
        .font(.body)
    }
}
