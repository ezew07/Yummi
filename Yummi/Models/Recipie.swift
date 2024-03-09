//
//  Recipie.swift
//  Yummi
//
//  Created by William Eze on 11/02/2024.
//

import Foundation

struct Recipie {
    let name: String
    var ingredients: [RecipieIngredient]
    var isFavourite: Bool
    var rating: Int
    var instructions: [String]
    var servings: Int
    var displayInfo: String {
        """
        Name: \(self.name)
        Favourite: \(self.isFavourite ? "Yes": "No")
        Rating: \(self.rating)/5
        """
    }
    #if DEBUG
    static let exampleRecipies: [Recipie] = [
        Recipie(name: "Kefta", ingredients: [RecipieIngredient(ingredient: Ingredient(name: "Bread", unit: .loaves, category: .carbohydrate), recipieQuantity: 1), RecipieIngredient(ingredient: Ingredient(name: "Egg", unit: .dozens, category: .proteins), recipieQuantity: 3)], isFavourite: false, rating: 2, instructions: ["Gather ingredients", "Mix the meat and seasonings", "Form the kefta", "Cook the kefta", "Serve the kefta"], servings: 4),
        Recipie(name: "Jollof", ingredients: [RecipieIngredient(ingredient: Ingredient(name: "Wheat", unit: .kilograms, category: .carbohydrate), recipieQuantity: 1), RecipieIngredient(ingredient: Ingredient(name: "Beef", unit: .kilograms, category: .proteins), recipieQuantity: 3)], isFavourite: true, rating: 5, instructions: ["Prepare the ingredients", "Parboil the rice", "Make the Jollof sauce", "Cook the rice", "Serve and garnish"], servings: 7)
        ]
    #endif
    
}
