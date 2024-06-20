//
//  DessertRowItem.swift
//  DerekDesserts
//
//  Created by Derek Howes on 6/19/24.
//

import SwiftUI

struct DessertRowItem: View {
    var meal: DessertMeal
    
    var body: some View {
        HStack {
            AsyncImage(
                url: URL(string: meal.image),
                content: { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 25.0)
                        )
                },
                placeholder: {
                    CustomProgressView(width: 100, height: 100)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 25.0)
                        )
                }
            )
            .frame(width: 100, height: 100)
            
            VStack {
                
                Text(meal.name)
                    .font(.system(size: 18, weight: .bold))
            }
            
            Spacer()
        }
        .padding(.vertical, 15)
    }
}


#Preview {
    DessertRowItem(meal: DessertMeal(
        name: "Apam balik",
        image: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
        id: "53049")
    )
}
