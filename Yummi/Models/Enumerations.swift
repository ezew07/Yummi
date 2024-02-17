//
//  Enumerations.swift
//  Yummi
//
//  Created by Eze, William (IRG) on 30/01/2024.
//

import Foundation
import SwiftUI

enum Category: String, CaseIterable {
    case defaultCategory = "Choose a category"
    case Confectionary = "Confectionary"
    case Carbohydrate = "Carbohydrate"
    case Proteins = "Proteins"
    case Drinks = "Drinks"
}

enum Tab {
    case ingredientView
    case recipieView
    
    var view: some View {
        switch self {
        case .ingredientView:
            return AnyView(IngredientView(examples: Ingredients.examples))
        case .recipieView:
            return AnyView(RecipieView())
        }
    }
}
