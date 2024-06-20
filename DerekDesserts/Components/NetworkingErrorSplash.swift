//
//  NetworkingErrorSplash.swift
//  DerekDesserts
//
//  Created by Derek Howes on 6/19/24.
//

import SwiftUI

struct NetworkingErrorSplash: View {
    var pageDetails: String
    
    var body: some View {
        VStack(spacing: 18) {
            Image(systemName: "wifi.slash")
                .resizable()
                .scaledToFit()
                .foregroundColor(.gray)
                .frame(width: 300, height: 300)
            
            Text("Trouble Loading \(pageDetails)")
                .font(.system(size: 24, weight: .bold))
            
            Text("Please try again later")
                .font(.system(size: 16, weight: .light))
        }
    }
}


#Preview {
    NetworkingErrorSplash(pageDetails: "Recipe Details")
}
