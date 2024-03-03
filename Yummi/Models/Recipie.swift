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
    var displayInfo: String {
        """
        Name: \(self.name)
        Favourite: \(self.isFavourite ? "Yes": "No")
        Rating: \(self.rating)/5
        """
    }
    #if DEBUG
    static let exampleRecipies: [Recipie] = [
        Recipie(name: "Kefta", ingredients: Ingredient.examples, isFavourite: false, rating: 2),
        Recipie(name: "Jollof", ingredients: Ingredient.examples, isFavourite: true, rating: 5),
        ]
    #endif
    
}
