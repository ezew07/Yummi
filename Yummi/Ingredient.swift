//
//  Ingredient.swift
//  Yummi
//
//  Created by Eze, William (IRG) on 23/01/2024.
//

import Foundation

struct Ingredients {
    let name: String
    var quantity: Int
    var unit: String
    var category: Category
    var expiryDate: Date
    
    var displayInfo: String {
        return """
        Name: \(self.name)
        Quantity: \(self.quantity)
        Unit: \(self.unit)
        Category: \(self.category.rawValue)
        Expiry Date: \(self.expiryDate.formatted(date: .abbreviated, time: .shortened))
        """
    }
    
    #if DEBUG
    static let examples: [Ingredients] = [Ingredients(name: "Bread", quantity: 10, unit: "slice", category: Category.Carbohydrate, expiryDate: getDate(year: 2018, month: 1, day: 17, hour: 17, minute: 47)), Ingredients(name: "Egg", quantity: 2, unit: "dozens", category: Category.Proteins, expiryDate: getDate(year: 2020, month: 4, day: 11, hour: 13, minute: 58)), Ingredients(name: "Wheat", quantity: 30, unit: "kilograms", category: Category.Carbohydrate, expiryDate: getDate(year: 2025, month: 11, day: 13, hour: 23, minute: 1))
    ]
    #endif
}
