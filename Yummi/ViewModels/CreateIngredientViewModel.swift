//
//  CreateIngredientViewModel.swift
//  Yummi
//
//  Created by Eze, William (IRG) on 01/03/2024.
//

import Foundation

class CreateIngredientViewModel: ObservableObject{
    
    static let shared = CreateIngredientViewModel()
    private init() {}
    
    @Published var newInventoryIngredientName = ""
    @Published var newInventoryIngredientQuantity = Int()
    @Published var newInventoryIngredientUnit: Unit = .defaultUnit
    @Published var newInventoryIngredientCategory: Category = .defaultCategory
    @Published var newInventoryIngredientExpiryDate = Date()
    var allowedToCreateNewIngredient: Bool {
        if newInventoryIngredientName != "" && newInventoryIngredientQuantity > 0 && newInventoryIngredientUnit != .defaultUnit && newInventoryIngredientCategory != .defaultCategory{
            return true
        }
        else{
            return false
        }
    }

    func createInventoryIngredient(){
        IngredientViewModel.shared.inventoryIngredient.append(InventoryIngredient(ingredient: Ingredient(name: newInventoryIngredientName, unit: newInventoryIngredientUnit, category: newInventoryIngredientCategory), expiryDate: newInventoryIngredientExpiryDate, inventoryQuantity: newInventoryIngredientQuantity))
        IngredientViewModel.shared.ingredient.append(Ingredient(name: newInventoryIngredientName, unit: newInventoryIngredientUnit, category: newInventoryIngredientCategory))
        IngredientViewModel.shared.toggleCreateIngredient = false

    }
    
}
