//
//  EditProfileView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/24/24.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var user: User
    @State private var bioText: String
    @ObservedObject var vm: EditProfileViewModel
    
    init(user: Binding <User>) {
        self._user = user
        self.vm = EditProfileViewModel(user: self._user.wrappedValue)
        self._bioText = State(initialValue: _user.wrappedValue.bio ?? "")
    }
    
    var body: some View {
        VStack{
            HStack{
                Button {
                  dismiss()
                } label: {
                    Text("Cancel")
                }
               
                Spacer()
               
                Button {
                    vm.saveData(bioText)
                } label: {
                    Text("Done")
                }
                
            }.padding()
            
            TextArea(text: $bioText, placeholder: "add your bio here")
                .frame(width: 370, height: 200 )
                .padding()
            
            Spacer()
        }
        .onReceive(vm.$uploadComplete, perform: { completed in
            if completed {
                self.dismiss()
                self.user.bio = vm.user.bio
            }
        })
    }
}

