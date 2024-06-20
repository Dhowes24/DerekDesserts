//
//  CustomProgressView.swift
//  DereksDesserts
//
//  Created by Derek Howes on 6/19/24.
//

import SwiftUI

struct CustomProgressView: View {
    let width: CGFloat
    let height: CGFloat
    
    
    init(width: CGFloat = .infinity, height: CGFloat = 300) {
        self.width = width
        self.height = height
    }
    
    
    var body: some View {
        ProgressView()
            .frame(maxWidth: width, minHeight: height, maxHeight: height)
            .clipped()
            .background(.gray)
    }
}


#Preview {
    CustomProgressView()
}
