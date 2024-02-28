//
//  Ingredient.swift
//  Yummi
//
//  Created by Eze, William (IRG) on 23/01/2024.
//

import Foundation

struct Ingredient {
    let name: String
    var quantity: Int
    var unit: String
    var category: Category
    
    var displayInfo: String {
        return """
        Name: \(self.name)
        Quantity: \(self.quantity)
        Unit: \(self.unit)
        Category: \(self.category.rawValue)
        """
    }
    
    #if DEBUG
    static let examples: [Ingredient] = [Ingredient(name: "Bread", quantity: 10, unit: "slice", category: Category.Carbohydrate), Ingredient(name: "Egg", quantity: 2, unit: "dozens", category: Category.Proteins), Ingredient(name: "Wheat", quantity: 30, unit: "kilograms", category: Category.Carbohydrate), Ingredient(name: "Beef", quantity: 10, unit: "kg", category: .Proteins)]

    #endif
}
