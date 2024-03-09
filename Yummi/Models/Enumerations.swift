//
//  Enumerations.swift
//  Yummi
//
//  Created by Eze, William (IRG) on 30/01/2024.
//

import Foundation
import SwiftUI

enum Category: String, CaseIterable {
    case defaultCategory = ""
    case confectionary = "Confectionary"
    case carbohydrate = "Carbohydrate"
    case proteins = "Proteins"
    case drinks = "Drinks"
    case fruits = "Fruits"
    case vegetables = "Vegetables"
    case dairy = "Dairy"
    case grains = "Grains"
    case snacks = "Snacks"
    case meat = "Meat"
    case seafood = "Seafood"
    case condiments = "Condiments"
    case soups = "Soups"
    case desserts = "Desserts"
    case frozenFoods = "Frozen Foods"
    case bakery = "Bakery"
    case cannedGoods = "Canned Goods"
    case spices = "Spices"
    case herbs = "Herbs"
    case oils = "Oils"
    case sauces = "Sauces"
}


enum Unit: String, CaseIterable {
    case defaultUnit = ""
    case grams = "g"
    case kilograms = "kg"
    case milliliters = "ml"
    case liters = "L"
    case pieces = "pieces"
    case dozens = "dozens"
    case slices = "slices"
    case loaves = "loaves"
    case cups = "cups"
    case tablespoons = "tablespoons"
    case teaspoons = "teaspoons"
    case ounces = "ounces"
    case pounds = "pounds"
    case fluidOunces = "fl oz"
    case pints = "pints"
    case quarts = "quarts"
    case gallons = "gallons"
    case squareInches = "sq in"
    case squareCentimeters = "sq cm"
    case meters = "m"
    case centimeters = "cm"
    // Add more cases as needed
}
