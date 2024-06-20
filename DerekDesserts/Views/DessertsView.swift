//
//  ContentView.swift
//  DerekDesserts
//
//  Created by Derek Howes on 6/19/24.
//

import SwiftUI

struct DessertsView: View {
    @StateObject private var viewModel = DessertsViewModel()
    
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            VStack(spacing: 0) {
                HStack {
                    Text("Derek's Desserts")
                        .font(.system(size: 30, weight: .bold))
                        .padding(.bottom, 12)
                    
                    Spacer()
                }
                
                SeparatorLine()
                if viewModel.desserts.isEmpty && viewModel.loadComplete{
                    NetworkingErrorSplash(pageDetails: "Recipe List")
                } else {
                    ScrollView() {
                        ForEach(viewModel.desserts, id: \.self) { meal in
                            DessertRowItem(meal: meal)
                                .onTapGesture {
                                    viewModel.path.append(meal.id)
                                }
                        }
                    }
                    .padding(.horizontal, 12)
                }
                
                Spacer()
            }
            .navigationDestination(for: String.self) { string in
                DessertDetailsView(dessertID: string)
            }
        }
    }
}


#Preview {
    DessertsView()
}
