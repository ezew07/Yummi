//
//  RecipieIngredient.swift
//  Yummi
//
//  Created by Eze, William (IRG) on 05/03/2024.
//

import Foundation

struct RecipieIngredient {
    var ingredient: Ingredient
    var recipieQuantity: Int
    
    
    #if DEBUG
    static var examples = [
        RecipieIngredient(ingredient: Ingredient(name: "Bread", unit: "loaves", category: Category.Carbohydrate), recipieQuantity: 1),
        RecipieIngredient(ingredient: Ingredient(name: "Egg", unit: "dozens", category: Category.Proteins), recipieQuantity: 3),
        RecipieIngredient(ingredient: Ingredient(name: "Wheat", unit: "kg", category: Category.Carbohydrate), recipieQuantity: 1),
        RecipieIngredient(ingredient: Ingredient(name: "Beef", unit: "kg", category: Category.Proteins), recipieQuantity: 3)
    ]
    
    
    #endif
    
}
