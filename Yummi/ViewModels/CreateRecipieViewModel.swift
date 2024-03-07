//
//  CreateRecipieViewModel.swift
//  Yummi
//
//  Created by William Eze on 07/03/2024.
//

import Foundation

class CreateRecipieViewModel: ObservableObject{
    
    static let shared = CreateRecipieViewModel()
    private init() {}
    
    @Published var newRecipieName = ""
    @Published var newRecipieIsFavourite = false
    @Published var selectedIngredients: [Ingredient] = []
    @Published var newRecipieRating = 0
    @Published var newRecipieServings = 1
    @Published var newRecipieQuantity = 0
    @Published var newRecipieUnit: Unit = .defaultUnit
    @Published var newInventoryRecipieCategory: Category = .defaultCategory
    
    func updateNewRecipieIngredientsState (_ subject:Ingredient){
        if selectedIngredients.contains(where: { $0.name == subject.name }){
            selectedIngredients.removeAll(where: { $0.name == subject.name })
        }
        else{
            selectedIngredients.append(subject)
        }
    }
    
//    func createNewRecipie(){
//        RecipieViewModel.shared.recipies.append(Recipie(name: <#T##String#>, ingredients: [RecipieIngredient(ingredient: Ingredient(name: <#T##String#>, unit: <#T##Unit#>, category: <#T##Category#>), recipieQuantity: <#T##Float#>)], isFavourite: <#T##Bool#>, rating: <#T##Int#>, steps: <#T##[String]#>, servings: <#T##Int#>))
//    }
    
}
