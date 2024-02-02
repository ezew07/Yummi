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
}
