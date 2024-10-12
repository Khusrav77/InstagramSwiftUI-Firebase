//
//  UploadPostView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/10/24.
//

import SwiftUI

struct UploadPostView: View {
    // MARK: - Properties
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var capionsText: String = ""
    
    // MARK: - Body
    var body: some View {
        VStack {
            if postImage == nil {
                Button {
                    
                }label: {
                    Image("plus_photo")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180 , height: 180)
                        .padding(.top, 56)
                        .clipped()
                        .foregroundStyle(.black)
                }
            } else {
                HStack(alignment: .top) {
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96 , height: 96)
                        .clipped()
                    
                    TextField("Enter your caption", text: $capionsText)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(10)
                }.padding()
                
                Button {
                    
                } label: {
                    Text("Share")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

            }
            Spacer()
        }
    }
}

#Preview {
    UploadPostView()
}
