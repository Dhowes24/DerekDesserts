//
//  DessertDetailsView.swift
//  DereksDesserts
//
//  Created by Derek Howes on 6/19/24.
//

import SwiftUI

struct DessertDetailsView: View {
    @ObservedObject private var viewModel: DessertDetailsViewModel
    @Environment(\.dismiss) private var dismiss
    
    
    init(dessertID: String) {
        self.viewModel = DessertDetailsViewModel(dessertID: dessertID)
    }
    
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "arrow.backward")
                    .frame(width: 24, height: 24)
                    .onTapGesture {
                        dismiss()
                    }
                
                Spacer()
            }
            .padding( 12)
            
            SeparatorLine()
            
            ScrollView {
                if let dessertDetails = viewModel.dessertDetails {
                    VStack (alignment: .leading, spacing: 18){
                        if let img = dessertDetails.image {
                            AsyncImage(
                                url: URL(string: img),
                                content: { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(maxWidth: .infinity, maxHeight: 300)
                                        .clipped()
                                },
                                placeholder: {
                                    CustomProgressView()
                                }
                            )
                        }
                        
                        DessertDetailsInfo(dessertDetails)
                    }
                    
                } else {
                    if viewModel.loadComplete {
                        NetworkingErrorSplash(pageDetails: "Recipe Details")
                    } else {
                        CustomProgressView()
                    }
                }
                
                Spacer()
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}


#Preview {
    DessertDetailsView(dessertID: "53082")
}
