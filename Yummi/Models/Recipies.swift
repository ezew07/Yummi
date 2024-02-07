//
//  Recipies.swift
//  Yummi
//
//  Created by Eze, William (IRG) on 06/02/2024.
//

import Foundation

struct Recipie{
    let name: String
    let ingredients: Ingredients
    var isFavourite: Bool
    var rating: Int
    
    #if DEBUG
    static var exampleRecipies = [
        Recipie(name: "Kefta", ingredients: Ingredients.examples[4], isFavourite: true, rating: 2),
        Recipie(name: "Porridge", ingredients: Ingredients.examples[2], isFavourite: true, rating: 2)
        ]
    #endif
    
}
