//
//  Recipie.swift
//  Yummi
//
//  Created by William Eze on 11/02/2024.
//

import Foundation

struct Recipie {
    let name: String
    let ingredients: Ingredients
    var isFavourite: Bool
    var rating: Int
    var displayInfo: String {
        """
        Name: \(self.name)
        Ingredients: \(self.ingredients.name)
        Favourite: \(self.isFavourite ? "Yes": "No")
        Rating: \(self.rating)/5
        """
    }
    
    #if DEBUG
    static let exampleRecipies: [Recipie] = [
        Recipie(name: "Kefta", ingredients: Ingredients.examples[1], isFavourite: false, rating: 2),
        Recipie(name: "Jollof", ingredients: Ingredients.examples[2], isFavourite: true, rating: 5),

        ]
    #endif
    
}
