//
//  RegistrationView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/15/24.
//

import SwiftUI

struct RegistrationView: View {
    // MARK: - Properties
    @State private var email: String = ""
    @State private var userName: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    @State private var selectedImage: UIImage?
    @State private var image: Image?
    @State var imagePickerPresented: Bool = false
    @Environment(\.dismiss) var dismiss
    // MARK: - Body
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.purple, .blue],
                startPoint: .top,
                endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack {
                ZStack {
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .clipShape(Circle())
                    } else {
                        Button {
                            imagePickerPresented.toggle()
                        } label: {
                            Image("plus_photo")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 140, height: 140)
                                .foregroundStyle(.white)
                        }
                        .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
                            ImagePickerView(image: $selectedImage)
                        }
                    }
                }
                .padding()
                
                VStack(spacing: 20){
                    CustomTextfield(text: $email, placeholder: Text("Enter Youer email"), image: "envelope")
                        .padding(.horizontal, 32)
                    
                    CustomTextfield(text: $userName, placeholder: Text("Name"), image: "person")
                        .padding(.horizontal, 32)
                    
                    CustomTextfield(text: $fullName, placeholder: Text("Full name"), image: "person")
                        .padding(.horizontal, 32)
                    
                    CustomSecureField(text: $password, placeholder: Text("Password"))
                        .padding(.horizontal, 32)
                }
                
                Button {
                    
                } label: {
                    Text("Sign Up")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(width: 360, height: 50)
                        .background(.purple)
                        .clipShape(Capsule())
                        .padding()
                }
                
                Spacer()
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.subheadline)
                        
                        Text("Sign In")
                            .font(.headline)
                    }.foregroundStyle(.white)
                }
                .padding(.bottom, 16)
                
            }.padding(.top)
        }
        .navigationBarBackButtonHidden(true as Bool)
    }
}


extension RegistrationView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        image = Image(uiImage: selectedImage)
    }
}

#Preview {
    RegistrationView()
}
