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
    var expiryDate: Date
    
    var displayInfo: String {
        return """
        Name: \(self.name)
        Quantity: \(self.quantity)
        Unit: \(self.unit)
        Category: \(self.category.rawValue)
        Expiry Date: \(self.expiryDate.formatted(date: .abbreviated, time: .omitted))
        """
    }
    
    #if DEBUG
    static let examples: [Ingredient] = [Ingredient(name: "Bread", quantity: 10, unit: "slice", category: Category.Carbohydrate, expiryDate: getDate(year: 2018, month: 1, day: 17, hour: 17, minute: 47)), Ingredient(name: "Egg", quantity: 2, unit: "dozens", category: Category.Proteins, expiryDate: getDate(year: 2020, month: 4, day: 11, hour: 13, minute: 58)), Ingredient(name: "Wheat", quantity: 30, unit: "kilograms", category: Category.Carbohydrate, expiryDate: getDate(year: 2025, month: 11, day: 13, hour: 23, minute: 1)), Ingredient(name: "Beef", quantity: 10, unit: "kg", category: .Proteins, expiryDate: getDate(year: 2023, month: 11, day: 23, hour: 2, minute: 12))
    ]
    #endif
}
