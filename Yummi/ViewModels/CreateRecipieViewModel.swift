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
    @Published var selectedRecipieIngredients: [RecipieIngredient] = []
    @Published var newRecipieRating = 0
    @Published var newRecipieServings = 1
    @Published var newRecipieQuantity = 0
    @Published var newRecipieInstructions: [String] = []
    
    var allowedToCreateNewrecipie: Bool {
        if !newRecipieName.isEmpty && !selectedRecipieIngredients.isEmpty && !newRecipieInstructions.isEmpty{
            return true
        }
        else{
            return false
        }
        
    }
    
    func updateNewIngredientsState (_ subject:Ingredient){
        if selectedIngredients.contains(where: { $0.name == subject.name }){
            selectedIngredients.removeAll(where: { $0.name == subject.name })
        }
        else{
            selectedIngredients.append(subject)
        }
    }
    
    func addOrRemoveRecipieIngredient (_ subject: RecipieIngredient){
        if selectedRecipieIngredients.contains(where: { $0.ingredient.name == subject.ingredient.name}){
            selectedRecipieIngredients.removeAll(where: { $0.ingredient.name == subject.ingredient.name })
        }
        else{
            selectedRecipieIngredients.append(subject)
        }
    }
    
    func updateRecipieIngredientQuantity(_ subject: RecipieIngredient){
        if selectedRecipieIngredients.contains(where: { $0.ingredient.name == subject.ingredient.name}){
            selectedRecipieIngredients[findRecipieIngredientIndex(in: selectedRecipieIngredients, name: subject.ingredient.name)].recipieQuantity = subject.recipieQuantity
        }
    }

    func findExisitingRecipieQuantityForIngredient(_ subject: Ingredient) -> Float {
        if selectedRecipieIngredients.contains(where: { $0.ingredient.name == subject.name }){
            return selectedRecipieIngredients[findRecipieIngredientIndex(in: selectedRecipieIngredients, name: subject.name)].recipieQuantity
        }
        return 0
    }
    
    func addInstruction(_ newInstruction: String){
        newRecipieInstructions.append(newInstruction)
    }

    func deleteInstruction(_ index: Int){
        newRecipieInstructions.remove(at: index)
    }
    
    func createNewRecipie(){
        RecipieViewModel.shared.recipies.append(Recipie(name: newRecipieName, ingredients: selectedRecipieIngredients, isFavourite: newRecipieIsFavourite, rating: newRecipieRating, instructions: newRecipieInstructions, servings: newRecipieServings))
    }
    
}
