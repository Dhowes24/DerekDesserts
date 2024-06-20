//
//  File.swift
//  DereksDesserts
//
//  Created by Derek Howes on 6/19/24.
//

import SwiftUI

struct SeparatorLine: View {
    var body: some View {
            Rectangle()
            .fill(.gray)
                .frame(minWidth: 0,maxWidth: .infinity,minHeight: 1,maxHeight: 1,alignment: .center)
    }
}


#Preview {
    SeparatorLine()
}
