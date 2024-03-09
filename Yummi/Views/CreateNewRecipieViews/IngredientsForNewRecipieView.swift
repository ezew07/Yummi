//
//  IngredientsForNewRecipieView.swift
//  Yummi
//
//  Created by William Eze on 07/03/2024.
//

import SwiftUI

struct IngredientsForNewRecipieView: View {
    @ObservedObject var sharedIngredientVM = IngredientViewModel.shared
    @ObservedObject var sharedRecipieVM = CreateRecipieViewModel.shared
    var body: some View {
        VStack{
            List{
                ForEach(sharedIngredientVM.ingredient, id: \.name){ ingredient in
                    MultipleSelectionRowView(newRecipieIngredientQuantity: sharedRecipieVM.findExisitingRecipieQuantityForIngredient(ingredient), isSelected: sharedRecipieVM.selectedIngredients.contains { $0.name == ingredient.name}, ingredient: ingredient)
                }
            }
        }
        .navigationTitle("Ingredients")
    }
}

#Preview {
    IngredientsForNewRecipieView()
}
