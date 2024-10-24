//
//  Loginview.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/15/24.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Properties
    @EnvironmentObject var vm: AuthViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
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
                        
                        CustomSecureField(text: $password, placeholder: Text("Password"))
                            .padding(.horizontal, 32)
                    }
                    
                    HStack {
                        Spacer()
                        
                        NavigationLink(destination: ResetPasswordView(email: $email)) {
                            Text("Forgot Password?")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .padding(.trailing, 28)
                                .padding(.top)
                        }
                    }
                    
                    Button {
                        vm.logIn(with: email, password: password)
                    } label: {
                        Text("Sign In")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .frame(width: 360, height: 50)
                            .background(.purple)
                            .clipShape(Capsule())
                            .padding()
                    }
                    
                    Spacer()
                    NavigationLink(destination: RegistrationView()) {
                        HStack {
                            Text("Don't have an account?")
                                .font(.subheadline)
                            
                            Text("Sign Up")
                                .font(.headline)
                        }.foregroundStyle(.white)
                    }
                    .padding(.bottom, 16)
                    
                }.padding(.top)
            }
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}
