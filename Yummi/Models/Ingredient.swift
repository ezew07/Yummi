//
//  Ingredient.swift
//  Yummi
//
//  Created by Eze, William (IRG) on 23/01/2024.
//

import Foundation

struct Ingredient {
    let name: String
    var unit: String
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
        Ingredient(name: "Bread", unit: "loaves", category: Category.Carbohydrate),
        Ingredient(name: "Egg", unit: "dozens", category: Category.Proteins),
        Ingredient(name: "Wheat", unit: "kg", category: Category.Carbohydrate),
        Ingredient(name: "Beef", unit: "kg", category: Category.Proteins)
    ]


    #endif
}
