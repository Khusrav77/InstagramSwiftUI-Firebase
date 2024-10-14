//
//  UploadPostView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/10/24.
//

import SwiftUI

struct UploadPostView: View {
    // MARK: - Properties
    @State var selectedImage: UIImage?
    @State var postImage: Image?
    @State var capionsText: String = ""
    @State var imagePickerPresented: Bool = false
    
    // MARK: - Body
    var body: some View {
        VStack {
            if postImage == nil {
                Button {
                    imagePickerPresented.toggle()
                }label: {
                    Image("plus_photo")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180 , height: 180)
                        .padding(.top, 56)
                        .clipped()
                        .foregroundStyle(.black)
                }.sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
                    ImagePickerView(image: $selectedImage)
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

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}

#Preview {
    UploadPostView()
}
