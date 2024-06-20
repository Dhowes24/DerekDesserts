//
//  DessertDetailsInfo.swift
//  DereksDesserts
//
//  Created by Derek Howes on 6/19/24.
//

import SwiftUI

struct DessertDetailsInfo: View {
    var dessertDetails: DessertDetailsMeal
    var separateInstructions: [String]
    
    init(_ dessertDetails: DessertDetailsMeal) {
        self.dessertDetails = dessertDetails
        self.separateInstructions = []
        self.separateInstructions = separateInstructions(instructions: dessertDetails.instructions)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text(dessertDetails.name)
                        .font(.system(size: 30, weight: .bold))
                    Spacer()
                }
                .padding(.vertical, 18)
                
                if !dessertDetails.ingredients.isEmpty {
                    Text("Ingredients:")
                        .font(.system(size: 18, weight: .bold))
                    
                    ForEach(0..<dessertDetails.ingredients.count, id: \.self) { ingredientIndex in
                        HStack(alignment: .top) {
                            Text(dessertDetails.measurements[ingredientIndex])
                                .frame(width: 100, alignment: .leading)
                            
                            Text(dessertDetails.ingredients[ingredientIndex])
                        }
                        .padding(.vertical, 1)
                    }
                }
                
                if !dessertDetails.instructions.isEmpty {
                    VStack(alignment: .leading, spacing: 18) {
                        Text("Instructions:")
                            .font(.system(size: 18, weight: .bold))
                            .padding(.top, 18)
                        
                        ForEach(0..<separateInstructions.count, id: \.self) { index in
                            HStack(alignment: .top) {
                                Text("\((index+1).description).")
                                    .frame(width: 25)
                                Text(separateInstructions[index])
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 18)
        }
    }
    
    
    func separateInstructions(instructions: String) -> [String] {
        var separateInstructions = instructions.components(separatedBy: "\r\n")
        separateInstructions.removeAll { String in
            let trimmedString = String.trimmingCharacters(in: .whitespacesAndNewlines)
            return trimmedString.count == 0
        }
        return separateInstructions
    }
}
