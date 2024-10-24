//
//  LazyView.swift
//  Instagram+Firebase
//
//  Created by Khusrav Safiev on 10/24/24.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let builder: () -> Content
    
    init(_ builder: @autoclosure @escaping () -> Content) {
        self.builder = builder
    }
    
    var body: Content {
        builder()
    }
}
