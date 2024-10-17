//
//  CustomTextfield.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/15/24.
//

import SwiftUI

struct CustomTextfield: View {
    @Binding var text: String
    let placeholder: Text
    let image: String
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundStyle(.white.opacity(0.8))
                    .padding(.leading, 40)
            }
            HStack{
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.white)
                    .padding(.leading, 10)
                
                TextField("", text: $text)
                    
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .foregroundStyle(.white.opacity(0.8))
            .background(Color.white.opacity(0.15))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    CustomTextfield(text: .constant(""), placeholder: Text("Placeholder"), image: "")
}
