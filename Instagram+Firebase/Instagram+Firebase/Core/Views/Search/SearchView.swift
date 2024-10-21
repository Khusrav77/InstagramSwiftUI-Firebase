//
//  SearchView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/10/24.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    @State var inSearchMode: Bool = false
    @ObservedObject var vm = SearchViewModel()
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
            
            ZStack {
                if inSearchMode {
                    UserListView(vm: vm, searchText: $searchText)
                } else {
                    PostGridView(config: .explore)
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
