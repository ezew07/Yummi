//
//  Recipie.swift
//  Yummi
//
//  Created by William Eze on 11/02/2024.
//

import Foundation

struct Recipie {
    let name: String
    let ingredients: [Ingredient]
    var isFavourite: Bool
    var rating: Int
    var steps: [String]
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
        Recipie(name: "Kefta", ingredients: Ingredient.examples, isFavourite: false, rating: 2, steps: ["Gather ingredients", "Mix the meat and seasonings", "Form the kefta", "Cook the kefta", "Serve the kefta"], servings: 4),
        Recipie(name: "Jollof", ingredients: Ingredient.examples, isFavourite: true, rating: 5, steps: ["Prepare the ingredients", "Parboil the rice", "Make the Jollof sauce", "Cook the rice", "Serve and garnish"], servings: 7)
        ]
    #endif
    
}
