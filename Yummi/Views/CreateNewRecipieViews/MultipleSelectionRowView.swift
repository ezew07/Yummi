//
//  MultipleSelectionRowView.swift
//  Yummi
//
//  Created by William Eze on 07/03/2024.
//


import SwiftUI

struct MultipleSelectionRowView: View {
    @ObservedObject var shared = CreateRecipieViewModel.shared
    
    @State var newRecipieIngredientQuantity: Float
    var isSelected: Bool
    var ingredient: Ingredient
    
    var body: some View {
        VStack{
            Button(action: {shared.updateNewIngredientsState(ingredient)
                shared.addOrRemoveRecipieIngredient(RecipieIngredient(ingredient: ingredient, recipieQuantity: newRecipieIngredientQuantity))
            }){
                HStack {
                    Text(ingredient.name)
                    Spacer()
                    if isSelected {
                        Text("✅")
                    }
                }
            }
            if isSelected{
                HStack {
                    TextField("Quantity", value: $newRecipieIngredientQuantity, formatter: NumberFormatter())
                        .onChange(of: newRecipieIngredientQuantity){
                            shared.updateRecipieIngredientQuantity(RecipieIngredient(ingredient: ingredient, recipieQuantity: newRecipieIngredientQuantity))
                        }
                        .keyboardType(.numberPad)
                    Text("\(ingredient.unit.rawValue)")
                }
            }
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    MultipleSelectionRowView(newRecipieIngredientQuantity: 1, isSelected: true, ingredient: Ingredient.examples[0])
}
