//
//  CustomInputView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/22/24.
//

import SwiftUI

struct CustomInputView: View {
    @Binding var inputText: String
    var action: () -> Void
    var body: some View {
        VStack {
            Rectangle()
                .foregroundStyle(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                .padding(.bottom, 8)
            
            HStack{
                TextField("Message", text: $inputText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(height: 30)
                
                Button {
                  action()
                } label: {
                    Text("Send")
                        .font(.headline)
                        .foregroundStyle(.black)
                }

            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CustomInputView(inputText: .constant(""), action: {})
}
