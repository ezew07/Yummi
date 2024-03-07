//
//  Ingredient.swift
//  Yummi
//
//  Created by Eze, William (IRG) on 23/01/2024.
//

import Foundation

struct Ingredient {
    let name: String
    var unit: Unit
    var category: Category
    
    var displayInfo: String {
        return """
        Name: \(self.name)
        Unit: \(self.unit)
        Category: \(self.category.rawValue)
        """
    }
    
    #if DEBUG
    static let examples: [Ingredient] = [
        Ingredient(name: "Bread", unit: .loaves, category: .carbohydrate),
        Ingredient(name: "Egg", unit: .dozens, category: .proteins),
        Ingredient(name: "Wheat", unit: .kilograms, category: .carbohydrate),
        Ingredient(name: "Beef", unit: .kilograms, category: .proteins)
    ]


    #endif
}
