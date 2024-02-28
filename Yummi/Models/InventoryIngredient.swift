//
//  InventoryIngredient.swift
//  Yummi
//
//  Created by William Eze on 27/02/2024.
//

import Foundation

struct InventoryIngredient {
    var ingredient: Ingredient
    var expiryDate: Date
    
    var displayInfo: String {
        return """
        Name: \(self.ingredient.name)
        Quantity: \(self.ingredient.quantity)
        Unit: \(self.ingredient.unit)
        Category: \(self.ingredient.category.rawValue)
        Expiry Date: \(self.expiryDate.formatted(date: .abbreviated, time: .omitted))
        """
    }
    
    #if DEBUG
    static let examples: [InventoryIngredient] = [
        InventoryIngredient(ingredient: Ingredient.examples[0], expiryDate: getDate(year: 2018, month: 1, day: 17, hour: 17, minute: 47)),
        InventoryIngredient(ingredient: Ingredient.examples[1], expiryDate: getDate(year: 2020, month: 5, day: 43, hour: 17, minute: 47)),
        InventoryIngredient(ingredient: Ingredient.examples[2], expiryDate: getDate(year: 2023, month: 7, day: 23, hour: 17, minute: 47)),
        InventoryIngredient(ingredient: Ingredient.examples[3], expiryDate: getDate(year: 2024, month: 11, day: 9, hour: 17, minute: 47))
    ]

    #endif
    
}
