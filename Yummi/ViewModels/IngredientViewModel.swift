//
//  IngredientViewModel.swift
//  Yummi
//
//  Created by Eze, William (IRG) on 01/03/2024.
//

import Foundation

class IngredientViewModel: ObservableObject {
    
    static let shared = IngredientViewModel()
    private init() {}
    
    @Published var inventoryIngredient: [InventoryIngredient] = InventoryIngredient.examples
    @Published var ingredient: [Ingredient] =  Ingredient.examples
    
    @Published var selectedIngredient = 0 {
        didSet{
            if selectedIngredient > inventoryIngredient.count - 1{
                selectedIngredient = 0
            }
        }
    }
    @Published var toggleCreateIngredient: Bool = false

    func deleteInventoryIngredient(_ subject: InventoryIngredient){
        inventoryIngredient.remove(at: findInventoryIngredientIndex(in: inventoryIngredient, name: subject.ingredient.name))
    }
    
}
