//
//  StateController.swift
//  Yummi
//
//  Created by William Eze on 23/02/2024.
//

import Foundation

class StateController: ObservableObject {
    @Published var recipies: [Recipie]
    @Published var inventoryIngredient: [InventoryIngredient]
    @Published var ingredient: [Ingredient]
    
    init() {
        recipies = Recipie.exampleRecipies
        inventoryIngredient = InventoryIngredient.examples
        ingredient = Ingredient.examples
    }
}

