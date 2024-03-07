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
        List{
            ForEach(sharedIngredientVM.ingredient, id: \.name){ ingredient in
                MultipleSelectionRowView(title: ingredient.name, isSelected: sharedRecipieVM.selectedIngredients.contains { $0.name == ingredient.name}, ingredient: ingredient)
                if sharedRecipieVM.selectedIngredients.contains(where: { $0.name == ingredient.name}) {
                    HStack {
                        TextField("Quantity", value: $sharedRecipieVM.newRecipieQuantity, formatter: NumberFormatter())
                        Text("\(ingredient.unit.rawValue)")
                    }
                }
            }
        }
    }
}

#Preview {
    IngredientsForNewRecipieView()
}
