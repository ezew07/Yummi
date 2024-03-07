//
//  MultipleSelectionRowView.swift
//  Yummi
//
//  Created by William Eze on 07/03/2024.
//




//{
//    Section{

//}

import SwiftUI

struct MultipleSelectionRowView: View {
    @ObservedObject var shared = CreateRecipieViewModel.shared
    var title: String
    var isSelected: Bool
    var ingredient: Ingredient
    
    var body: some View {
        VStack{
            Button(action: {shared.updateNewRecipieIngredientsState(ingredient)}){
                HStack {
                    Text(title)
                    Spacer()
                    if isSelected {
                        Text("✅")
                    }
                }
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    MultipleSelectionRowView(title: "Food", isSelected: true, ingredient: Ingredient.examples[0])
}
