//
//  ResetPasswordView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/15/24.
//

import SwiftUI

struct ResetPasswordView: View {
    @EnvironmentObject var vm: AuthViewModel
    @Binding private var email: String
    @Environment(\.dismiss) var dismiss
    
    init(email: Binding <String>) {
        self._email = email
    }
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.purple, .blue],
                startPoint: .top,
                endPoint:.bottom)
            .ignoresSafeArea()
            
            VStack {
                Image("instagram_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                VStack(spacing: 20){
                    CustomTextfield(text: $email, placeholder: Text("Enter Youer email"), image: "envelope")
                        .padding(.horizontal, 32)
                    
                }
                
                Button {
                    vm.resetPassword(email: email)
                } label: {
                    Text("Send Reset Password")
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
        .onReceive(vm.$didSendRessetPassword, perform: { completed in
           if completed {
               self.dismiss()
            }
        })
    }
}
