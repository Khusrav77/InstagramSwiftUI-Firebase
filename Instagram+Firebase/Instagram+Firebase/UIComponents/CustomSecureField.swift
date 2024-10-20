//
//  CustomSecureField.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/15/24.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var text: String
    let placeholder: Text
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundStyle(.white.opacity(0.8))
                    .padding(.leading, 40)
            }
            HStack{
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.white)
                    .padding(.leading, 10)
                
                SecureField("", text: $text)
                    
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .foregroundStyle(.white.opacity(0.8))
            .background(Color.white.opacity(0.15))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        
    }
}

#Preview {
    CustomSecureField(text: .constant(""), placeholder: Text("Placeholder"))
}
