//
//  EditProfileView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/24/24.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State private var text: String = ""
    @ObservedObject var vm: EditProfileViewModel
    
    init(vm: EditProfileViewModel) {
        self.vm = vm
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
                    vm.saveData(text)
                } label: {
                    Text("Done")
                }
                
            }.padding()
            
            TextArea(text: $text, placeholder: "add your bio here")
                .frame(width: 370, height: 200 )
                .padding()
            
            Spacer()
        }
        .onReceive(vm.$uploadComplete, perform: { _ in
            self.dismiss()
        })
    }
}

