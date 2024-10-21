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
    @State var captionsText: String = ""
    @State var imagePickerPresented: Bool = false
    @Binding var tabIndex: Int
    @ObservedObject var vm = UploadPostViewModel()
    
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
            } else if let image = postImage {
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96 , height: 96)
                        .clipped()
                    
                    TextArea(text: $captionsText, placeholder: "Enter your caption")
                        .frame(height: 200 )
                    
                    
                }.padding()
                
                HStack(spacing: 16) {
                    Button {
                        captionsText = ""
                        postImage = nil
                        
                    } label: {
                        Text("Cancle")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 172, height: 50)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    
                    Button {
                        if let image = selectedImage {
                            vm.uploadPost(caption: captionsText , image: image) { _ in
                                captionsText = ""
                                postImage = nil
                                tabIndex = 0
                            }
                        }
                        
                    } label: {
                        Text("Share")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 172, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                .padding()
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
    UploadPostView(tabIndex: .constant(0))
}
