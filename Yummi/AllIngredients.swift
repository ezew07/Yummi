//
//  AllIngredients.swift
//  Yummi
//
//  Created by William Eze on 29/01/2024.
//

import Foundation

struct AllIngredients {
    var ingredients: [Ingredients] = [Ingredients(name: "Bread", quantity: 10, unit: "slice", category: Category.Carbohydrate, expiryDate: getDate(year: 2018, month: 1, day: 17, hour: 17, minute: 47)), Ingredients(name: "Egg", quantity: 2, unit: "dozens", category: Category.Proteins, expiryDate: getDate(year: 2020, month: 4, day: 11, hour: 13, minute: 58)), Ingredients(name: "Wheat", quantity: 30, unit: "kilograms", category: Category.Carbohydrate, expiryDate: getDate(year: 2025, month: 11, day: 13, hour: 23, minute: 1))
    ]
}
