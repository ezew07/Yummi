//
//  RecipieIngredient.swift
//  Yummi
//
//  Created by Eze, William (IRG) on 05/03/2024.
//

import Foundation

struct RecipieIngredient {
    var ingredient: Ingredient
    var recipieQuantity: Float
    
    
    #if DEBUG
    static var examples = [
        RecipieIngredient(ingredient: Ingredient(name: "Bread", unit: .loaves, category: .carbohydrate), recipieQuantity: 1),
        RecipieIngredient(ingredient: Ingredient(name: "Egg", unit: .dozens, category: .proteins), recipieQuantity: 3),
        RecipieIngredient(ingredient: Ingredient(name: "Wheat", unit: .kilograms, category: .carbohydrate), recipieQuantity: 1),
        RecipieIngredient(ingredient: Ingredient(name: "Beef", unit: .kilograms, category: .proteins), recipieQuantity: 3)
    ]
    
    
    #endif
    
}
